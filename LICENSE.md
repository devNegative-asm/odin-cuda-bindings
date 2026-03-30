# Disclaimer

The NVIDIA® CUDA™ trademark is owned by Nvidia corporation. This project has no relationship with Nvidia corporation, and is not endorsed by Nvidia.

Code in this repository provides odin bindings for APIs implemented in libcuda, libcuvid, and other cuda-related APIs. The purpose of these bindings is to make cuda code available and accessible to the odin programming language, and is derivative of the C headers provided in the cuda toolkit.

As decided in Google LLC v. Oracle America, Inc., 593 U.S. 1 (2021), the copying of declaration code for APIs can fall into the realm of fair use, and that is the intention with these bindings.

With regard to the four factors of fair use:

### 1. Purpose and Character of the Use
This factor focuses mainly on the context of the use, and whether it is transformative or not.

Transformative nature: The original C/C++ headers are designed for cuda to be used from C and C++ programs. These bindings make those cuda functions available to odin programs. It is transformative in the sense that it takes the API programmers are already used to in C and C++, and makes that API available to users programming in odin, which is otherwise incapable of calling cuda functions. There is no equivalent element included in the cuda toolkit that would let programmers using odin call cuda functions.

context of the use: These bindings are being provided to all users with no direct benefit to the author of the bindings. The bindings in and of themselves are nonfunctional in the sense that they do not create a marketable product, and so further determination of the use depends on in which project they are being used. These bindings have equal potential to be used in educational or professional software.

### 2. Nature of the copyrighted work

Best for explaining this, I believe, is a passage from the opinion in Google v. Oracle.

> Although copyrights protect many different kinds of writing, Leval 1116, we have emphasized the need to “recogni[ze] that some works are closer to the core of [copyright] than others,” Campbell, 510 U. S., at 586. In our view, for the reasons just described, the declaring code is, if copyrightable at all, further than are most computer programs (such as the implementing code) from the core of copyright. That fact diminishes the fear, expressed by both the dissent and the Federal Circuit, that application of “fair use” here would seriously undermine the general copyright protection that Congress provided for computer programs. And it means that this factor, “the nature of the copyrighted work,” points in the direction of fair use.

### 3. Amount and Substantiality of the Portion Used

This project is derivative of a decent number of the header files used as a basis for this project. However, similar to the case in Google v. Oracle, no implementation code was copied. Nor does this project provide the same gpu intrinsics (declaration or implementation) that would be present in a standard cuda toolkit.

For a relevant quotation from the court opinion,
> Google copied those lines not because of their creativity, their beauty, or even (in a sense) because of their purpose. It copied them because programmers had already learned to work with the Sun Java API’s system, and it would have been difficult, perhaps prohibitively so, to attract programmers to build its Android smartphone system without them.

Replace "Sun Java API" with cuda API, and "Android smartphone system" with "odin package ecosystem" and you get a similar conclusion

### 4. Effect on the Market for the Original Work

This one is even more straightforward. No code in this package is functional if the user of it does not have access to the nvidia cuda libraries. Anyone who uses this code must already have downloaded Nvidia's version of the same code (the Nvidia cuda toolkit), otherwise this code will have no use. Bindings for cuda APIs do not and can not on their own be used as a substitute for the actual cuda toolkit (compare to zluda, which can be used as a substitute).

---

Due to these factors, I believe the release of this package constitutes a fair use.

The terms of licensing this package are as follow (modified BSD):

## Terms

Copyright © 2026, devnegative-asm

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.