// Copyright 2018 The Bazel Authors. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
package com.google.devtools.build.lib.exec.local;

import com.google.common.base.Strings;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.google.devtools.build.lib.exec.BinTools;
import java.util.Map;

/** {@link LocalEnvProvider} implementation for actions running on Unix-like platforms. */
public final class PosixLocalEnvProvider implements LocalEnvProvider {
  private final Map<String, String> clientEnv;

  /**
   * Create a new {@link PosixLocalEnvProvider}.
   *
   * @param clientEnv a map of the current Bazel command's environment
   */
  public PosixLocalEnvProvider(Map<String, String> clientEnv) {
    this.clientEnv = clientEnv;
  }

  /**
   * Compute an environment map for local actions on Unix-like platforms (e.g. Linux, macOS).
   *
   * <p>Returns a map with the same keys and values as {@code env}. Overrides the value of TMPDIR
   * (or adds it if not present in {@code env}) by the value of {@code clientEnv.get("TMPDIR")}, or
   * if that's empty or null, then by "/tmp".
   */
  @Override
  public Map<String, String> rewriteLocalEnv(
      Map<String, String> env, BinTools binTools, String fallbackTmpDir) {
    ImmutableMap.Builder<String, String> result = ImmutableMap.builder();
    result.putAll(Maps.filterKeys(env, k -> !(k.equals("TMPDIR") || k.equals("LD_LIBRARY_PATH"))));
    String p = clientEnv.get("TMPDIR");
 
    // ATTEMPT TO FIX LD_LIBRARY_PATH
    // (bazel breaks LD_LIBRARY_PATH meaning binaries can't find libstdc++ 
    // properly)
    // Dr Owain Kenway, UCL Research Computing.
  
    String l = clientEnv.get("LD_LIBRARY_PATH");
    l = "/shared/ucl/apps/gcc/4.9.2/lib:/shared/ucl/apps/gcc/4.9.2/lib64:" + l;

    if (Strings.isNullOrEmpty(p)) {
      // Do not use `fallbackTmpDir`, use `/tmp` instead. This way if the user didn't export TMPDIR
      // in their environment, Bazel will still set a TMPDIR that's Posixy enough and plays well
      // with heavily path-length-limited scenarios, such as the socket creation scenario that
      // motivated https://github.com/bazelbuild/bazel/issues/4376.
      p = "/tmp";
    }
    result.put("TMPDIR", p);
    result.put("LD_LIBRARY_PATH", l);
    return result.build();
  }
}
