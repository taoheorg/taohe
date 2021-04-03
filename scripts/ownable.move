/**
 * Copyright 2021 Solarius Properties Ky
 * Authors: Ville Sundell
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

script {
    use {{sender}}::Torch;
    use {{sender}}::Root;
    use {{sender}}::Ownable;

    fun main(account: &signer) {
        Root::create<Ownable::Tao<Torch::Tao>>(account, Ownable::new<Torch::Tao>({{sender}}, Torch::new()));
    }
}

script {
    use {{sender}}::Torch;
    use {{sender}}::Root;
    use {{sender}}::Ownable;

    fun main(account: &signer) {
        // Extract torch, and wrap it into Root
        Root::create<Torch::Tao>(account, Ownable::extract<Torch::Tao>(account, Root::extract<Ownable::Tao<Torch::Tao>>(account)));
    }
}