Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::234; helo=mail-oi0-x234.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f9uaH2I6"; 
 dkim-atps=neutral
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lfwn1YBhzDq6t
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 15:25:28 +1000 (AEST)
Received: by mail-oi0-x234.google.com with SMTP id j205-v6so1701623oib.4
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 22:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Pd16yTGRA4tZ2fvAv9q3wkkTQLIJxPA+KSP6FFhyDzg=;
 b=f9uaH2I6hpSmj4OythyzH69GCLYlcy6H3KP1E6X3ZHXBEE3QKeZyfdSh8zvFnxqndc
 FBC0IFbhtlE/m6zVE/uVgcRLhxyyG6JucQpscEopya4Tm3NcZP/wAjJZ0zT+3hjuEbaw
 +76ZPPckuUjAY8lq7eRdmDoGf+/TGrFDFzije8zNSFzQPYNGDYmjLRRXtt6kYEy1Oj6L
 QM2NmCZ8Iq63afIJGloSpT0lMudjc90JNxHlFKhNBLUqqOX5YUeOH78iyR0jaO6c+P85
 M3R50YWtCZ58fOSaLToi2lJko/jG8N3oWLxEvsslOCyiVLVa3sliM4C5DgUJxOmI1G/s
 s8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Pd16yTGRA4tZ2fvAv9q3wkkTQLIJxPA+KSP6FFhyDzg=;
 b=fVStAKBj51qelssDNjv0F5XbAB204HMN0goFBbesBtyb/PVIoxa6uvYsmgQZrkurjZ
 q4/yhEliOok32q6pnf7JQg9oeLdmwXIYuCseXHngy+k0tIDILyAV//ybspD/xPxFgMSR
 Z0hxbS6hShSWWiLzv/8Bg71uDes2XsJGeQmjDDBvaaBchQzRSspaPMk6HT9yJowBdXW9
 FnhA3sGm8Qeh9djn93c0gEXlenLCiYilsCl94+LULP9GSR/oEMQyRJYGH45F6kcuIC5X
 ehh3MLvZi85/qT3NV9evILMgLA0Ig9Ap2YsZTOfg1dIV5ZY0+tQRd3KU53xjZNuhUjOl
 owFA==
X-Gm-Message-State: AOUpUlF2l8HDJUWlMw6dreFgrcwsPHo45DIxPHLlhmkFHoJO+5Hvmy+M
 CSCYWq+pEdNlm+1TZ+ksfsHYIlIn6UcHxRdrins=
X-Google-Smtp-Source: AA+uWPwHZwuH/OexZRuQ3uKH/6m9lkJTyIQ2wXnZCGmP0k8hhnsF5h37M9tegdok70zO5cX/Kq1SuZHwwdBzilNYdgg=
X-Received: by 2002:aca:3787:: with SMTP id
 e129-v6mr1551064oia.39.1533705926139; 
 Tue, 07 Aug 2018 22:25:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c4a:0:0:0:0:0 with HTTP;
 Tue, 7 Aug 2018 22:25:25 -0700 (PDT)
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345827A58@ORSMSX114.amr.corp.intel.com>
References: <CAE33tLFQ6v2n2tBavZVJmHdYK1cFmFFhKRb9_8RG3xS4xzr6ug@mail.gmail.com>
 <25bebbd3-7df8-f396-ef62-0b846e3435aa@intel.com>
 <CAE33tLHsd5HwrCS9qLXO6Mo_gzka1Mrv7vs3Ofy0AF=YRJdT1w@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345827A58@ORSMSX114.amr.corp.intel.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 8 Aug 2018 10:55:25 +0530
Message-ID: <CAE33tLGtRSdcYgvavfR2Ezkk7XduS9jEkJuez5WYBiLe-AHN2A@mail.gmail.com>
Subject: Re: Phosphor Web-ui: Server unreachable
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000eae44e0572e5bcaf"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 05:25:31 -0000

--000000000000eae44e0572e5bcaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ed,

I made the changes suggested by you. But in building the system, I am
getting some configuration error. Please find the following log data.

Log data follows:
| DEBUG: Executing shell function do_configure
|
CMAKE_MODULE_PATH=3D/home/akash/Pictures/openbmc/build/tmp/work/armv6-openb=
mc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/git/cmake
| -- The CXX compiler identification is GNU 7.3.0
| -- The C compiler identification is GNU 7.3.0
| -- Check for working CXX compiler:
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/arm-openbmc-=
linux-gnueabi/arm-openbmc-linux-gnueabi-g++
| -- Check for working CXX compiler:
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/arm-openbmc-=
linux-gnueabi/arm-openbmc-linux-gnueabi-g++
-- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Check for working C compiler:
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/arm-openbmc-=
linux-gnueabi/arm-openbmc-linux-gnueabi-gcc
| -- Check for working C compiler:
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/arm-openbmc-=
linux-gnueabi/arm-openbmc-linux-gnueabi-gcc
-- works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Boost version: 1.64.0
| -- Found OpenSSL:
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libcrypto.so
(found version "1.0.2n")
| OPENSSL_INCLUDE_DIR
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/include
| CMAKE_BUILD_TYPE=3D
| -- Found ZLIB:
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libz.so
(found version "1.2.11")
| -- Performing Test PAM_MESSAGE_CONST
| -- Performing Test PAM_MESSAGE_CONST - Success
| -- Found PAM:
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/lib/libpam.so;/home/akash/P=
ictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+gitAU=
TOINC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libdl.so
| -- Configuring done
| CMake Error in CMakeLists.txt:
|

* Imported target "boost-dbus" includes non-existent path| |
"/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bo=
ost-dbus/1.0+gitAUTOINC+70f79f4d66-r0/recipe-sysroot/usr/include/dbus-1.0"*
|
|   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:
|
|   * The path was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and references files it does not
|   provide.
|
|
|
| CMake Error in CMakeLists.txt:
|

* Imported target "boost-dbus" includes non-existent path| |
"/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bo=
ost-dbus/1.0+gitAUTOINC+70f79f4d66-r0/recipe-sysroot/usr/include/dbus-1.0"*
|
|   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:
|
|   * The path was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and references files it does not
|   provide.
|
|
|
| -- Generating done
| CMake Warning:
|   Manually-specified variables were not used by the project:
|
|     CMAKE_INSTALL_BINDIR
|     CMAKE_INSTALL_DATAROOTDIR
|     CMAKE_INSTALL_INCLUDEDIR
|     CMAKE_INSTALL_LIBDIR
|     CMAKE_INSTALL_LIBEXECDIR
|     CMAKE_INSTALL_LOCALSTATEDIR
|     CMAKE_INSTALL_SBINDIR
|     CMAKE_INSTALL_SHAREDSTATEDIR
|     CMAKE_INSTALL_SYSCONFDIR
|
|
| -- Build files have been written to:
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/build
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmc=
web/1.0+gitAUTOINC+f4c4dcf438-r0/temp/log.do_configure.17054)



Thanks and Regards,

Akash G J

On Tue, Aug 7, 2018 at 7:54 PM, Tanous, Ed <ed.tanous@intel.com> wrote:

> This a security measure in bmcweb to prevent cross site scripting.  If
> you=E2=80=99re running phosphor-webui from another machine, you=E2=80=99r=
e essentially
> running cross site scripting as a development measure, which is exactly
> what the BMC sees, and the browser squashes the request as a suspected XS=
S
> attack.
>
>
>
> The easiest way to make this work for testing is to go to this file:
>
> https://github.com/openbmc/bmcweb/blob/master/include/
> security_headers_middleware.hpp
>
>
>
> and comment out lines 42-44, which set headers to prevent the bmc
> squashing the request.
>
>
>
> It=E2=80=99s been a while since I=E2=80=99ve developed like that, but you=
 likely also need
> to add a couple headers as well
>
> req.addHeader(=E2=80=9CAccess-Control-Allow-Origin=E2=80=9D, =E2=80=9C*=
=E2=80=9D);
>
> req.addHeader(=E2=80=9CAccess-Control-Allow-Methods=E2=80=9D, =E2=80=9CGE=
T, POST, PUT, PATCH=E2=80=9D);
>
>
>
> I know you=E2=80=99re not the first person to hit this unexpectedly.  If =
you get a
> header recipe that allows development, it would be great if you could
> codify it into an option called BMC_INSECURE_ALLOW_XSS, add it to the bui=
ld
> configuration, and put it up for a gerrit review;  I=E2=80=99m fairly cer=
tain it
> would help others.
>
>
>
> -Ed
>
>
>
> *From:* AKASH G J [mailto:akashgj91@gmail.com]
> *Sent:* Tuesday, August 7, 2018 3:13 AM
> *To:* Tanous, Ed <ed.tanous@intel.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: Phosphor Web-ui: Server unreachable
>
>
>
> Hi Ed,
>
>
>
> Sorry for the late reply. I was on leave for last week.
>
>
>
> I am hosting phosphor-webui on a different machine and trying to connect
> the BMC board using its IP address. I am using bmcweb platform. When I
> tried to login, the following message appeared in browser console.
>
>
>
> Cross-Origin Request Blocked: The Same Origin Policy disallows reading th=
e
> remote resource at https://<BMC-IP>/login. (Reason: CORS request did not
> succeed).
> <unavailable> activity-stream.bundle.js:3170:9
> CSI/tbsd_ cb=3Dgapi.loaded_0:458:127
> CSI/_tbnd cb=3Dgapi.loaded_0:458:127
> CSI/tbsd_ cb=3Dgapi.loaded_0:458:127
> CSI/_tbnd cb=3Dgapi.loaded_0:458:127
>
>
>
>
>
>
>
> Thanks and Regards,
>
>
>
> Akash
>
>
>
> On Mon, Jul 30, 2018 at 11:06 PM, Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 07/30/2018 05:04 AM, AKASH G J wrote:
>
> Hi Team,
>
> I added phosphor-webui into the Linux image and set up client side of the
> web interface. In the client side of web interface I could able to give t=
he
> IP address, username and password. After entering all those details, it i=
s
> showing "server unreachable". But I could able to ping the server board a=
nd
> ssh into the system. Please someone help to resolve the problem.
>
>
>
> Thanks and Regards,
>
> Akash G J
>
>
>
> We need some basic information to help you troubleshoot.  You might also
> find faster responses on irc;  Most of the people involved in the web
> infrastructure are online there.
>
> 1. What platform are you using?
> 2. If not one of the upstream platforms, which web server is your platfor=
m
> using?  (probably one of phosphor-rest, bmcweb, or phosphor-rest+nginx)
> 3. When you open up the debugger window in your chosen browser (usually
> the F12 key) then go to the network tab and attempt to log in, what do yo=
u
> see?  You should see an attempt to get to the /login url, with some kind =
of
> error code (maybe 401, maybe 500, maybe something else).  We'll need that
> to help troubleshoot.
> 4. Is there anything else strange about your setup that you might think
> would contribute to your issue?
> 5. Are you hosting phosphor-webui from a different machine from the BMC.
> Depending on what server you are using, there are likely security setting=
s
> preventing cross site scripting that are blocking you.
>
>
>

--000000000000eae44e0572e5bcaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ed,</div><div><br></div><div>I made the changes su=
ggested by you. But in building the system, I am getting some configuration=
 error. Please find the following log data.<br></div><div><br></div><div>Lo=
g data follows:<br>| DEBUG: Executing shell function do_configure<br>| CMAK=
E_MODULE_PATH=3D/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-l=
inux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/git/cmake<br>| -- The CXX =
compiler identification is GNU 7.3.0<br>| -- The C compiler identification =
is GNU 7.3.0<br>| -- Check for working CXX compiler: /home/akash/Pictures/o=
penbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c=
4dcf438-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-open=
bmc-linux-gnueabi-g++<br>| -- Check for working CXX compiler: /home/akash/P=
ictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+gitAU=
TOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi=
/arm-openbmc-linux-gnueabi-g++ -- works<br>| -- Detecting CXX compiler ABI =
info<br>| -- Detecting CXX compiler ABI info - done<br>| -- Detecting CXX c=
ompile features<br>| -- Detecting CXX compile features - done<br>| -- Check=
 for working C compiler: /home/akash/Pictures/openbmc/build/tmp/work/armv6-=
openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-gcc<br>| -=
- Check for working C compiler: /home/akash/Pictures/openbmc/build/tmp/work=
/armv6-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sys=
root-native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-gcc=
 -- works<br>| -- Detecting C compiler ABI info<br>| -- Detecting C compile=
r ABI info - done<br>| -- Detecting C compile features<br>| -- Detecting C =
compile features - done<br>| -- Boost version: 1.64.0<br>| -- Found OpenSSL=
: /home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/b=
mcweb/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libcrypto.so (fou=
nd version &quot;1.0.2n&quot;)<br>| OPENSSL_INCLUDE_DIR /home/akash/Picture=
s/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+=
f4c4dcf438-r0/recipe-sysroot/usr/include<br>| CMAKE_BUILD_TYPE=3D<br>| -- F=
ound ZLIB: /home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libz.so =
(found version &quot;1.2.11&quot;)<br>| -- Performing Test PAM_MESSAGE_CONS=
T<br>| -- Performing Test PAM_MESSAGE_CONST - Success<br>| -- Found PAM: /h=
ome/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmcwe=
b/1.0+gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/lib/libpam.so;/home/akash/Pic=
tures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTO=
INC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libdl.so<br>| -- Configuring done<=
br>| CMake Error in CMakeLists.txt:<br>|=C2=A0=C2=A0<b> Imported target &qu=
ot;boost-dbus&quot; includes non-existent path<br>| <br>|=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linu=
x-gnueabi/boost-dbus/1.0+gitAUTOINC+70f79f4d66-r0/recipe-sysroot/usr/includ=
e/dbus-1.0&quot;</b><br>| <br>|=C2=A0=C2=A0 in its INTERFACE_INCLUDE_DIRECT=
ORIES.=C2=A0 Possible reasons include:<br>| <br>|=C2=A0=C2=A0 * The path wa=
s deleted, renamed, or moved to another location.<br>| <br>|=C2=A0=C2=A0 * =
An install or uninstall procedure did not complete successfully.<br>| <br>|=
=C2=A0=C2=A0 * The installation package was faulty and references files it =
does not<br>|=C2=A0=C2=A0 provide.<br>| <br>| <br>| <br>| CMake Error in CM=
akeLists.txt:<br>|=C2=A0=C2=A0<b> Imported target &quot;boost-dbus&quot; in=
cludes non-existent path<br>| <br>|=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/home/aka=
sh/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/boost-dbus/1=
.0+gitAUTOINC+70f79f4d66-r0/recipe-sysroot/usr/include/dbus-1.0&quot;</b><b=
r>| <br>|=C2=A0=C2=A0 in its INTERFACE_INCLUDE_DIRECTORIES.=C2=A0 Possible =
reasons include:<br>| <br>|=C2=A0=C2=A0 * The path was deleted, renamed, or=
 moved to another location.<br>| <br>|=C2=A0=C2=A0 * An install or uninstal=
l procedure did not complete successfully.<br>| <br>|=C2=A0=C2=A0 * The ins=
tallation package was faulty and references files it does not<br>|=C2=A0=C2=
=A0 provide.<br>| <br>| <br>| <br>| -- Generating done<br>| CMake Warning:<=
br>|=C2=A0=C2=A0 Manually-specified variables were not used by the project:=
<br>| <br>|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_BINDIR<br>|=C2=A0=C2=A0=
=C2=A0=C2=A0 CMAKE_INSTALL_DATAROOTDIR<br>|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_I=
NSTALL_INCLUDEDIR<br>|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_LIBDIR<br>|=C2=
=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_LIBEXECDIR<br>|=C2=A0=C2=A0=C2=A0=C2=A0=
 CMAKE_INSTALL_LOCALSTATEDIR<br>|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_SBI=
NDIR<br>|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_SHAREDSTATEDIR<br>|=C2=A0=
=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_SYSCONFDIR<br>| <br>| <br>| -- Build files=
 have been written to: /home/akash/Pictures/openbmc/build/tmp/work/armv6-op=
enbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/build<br>| WARNING:=
 exit code 1 from a shell command.<br>| ERROR: Function failed: do_configur=
e (log file is located at /home/akash/Pictures/openbmc/build/tmp/work/armv6=
-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/temp/log.do_conf=
igure.17054)</div><div><br></div><div><br></div><div><br></div><div>Thanks =
and Regards,</div><div><br></div><div>Akash G J<br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 7, 2018 at 7:54=
 PM, Tanous, Ed <span dir=3D"ltr">&lt;<a href=3D"mailto:ed.tanous@intel.com=
" target=3D"_blank">ed.tanous@intel.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">





<div link=3D"blue" vlink=3D"purple" lang=3D"EN-US">
<div class=3D"m_8273620602523987487WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">This a security measure in bmcweb to =
prevent cross site scripting.=C2=A0 If you=E2=80=99re running phosphor-webu=
i from another machine, you=E2=80=99re essentially running cross site
 scripting as a development measure, which is exactly what the BMC sees, an=
d the browser squashes the request as a suspected XSS attack.<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">The easiest way to make this work for=
 testing is to go to this file:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><a href=3D"https://github.com/openbmc=
/bmcweb/blob/master/include/security_headers_middleware.hpp" target=3D"_bla=
nk">https://github.com/openbmc/<wbr>bmcweb/blob/master/include/<wbr>securit=
y_headers_middleware.<wbr>hpp</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">and comment out lines 42-44, which se=
t headers to prevent the bmc squashing the request.<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">It=E2=80=99s been a while since I=E2=
=80=99ve developed like that, but you likely also need to add a couple head=
ers as well<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">req.addHeader(=E2=80=9CAccess-Control=
-<wbr>Allow-Origin=E2=80=9D, =E2=80=9C*=E2=80=9D);<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">req.addHeader(=E2=80=9CAccess-Control=
-<wbr>Allow-Methods=E2=80=9D, =E2=80=9CGET, POST, PUT, PATCH=E2=80=9D);<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">I know you=E2=80=99re not the first p=
erson to hit this unexpectedly.=C2=A0 If you get a header recipe that allow=
s development, it would be great if you could codify it into
 an option called BMC_INSECURE_ALLOW_XSS, add it to the build configuration=
, and put it up for a gerrit review;=C2=A0 I=E2=80=99m fairly certain it wo=
uld help others.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">-Ed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><a name=3D"m_8273620602523987487__MailEndCompose"><s=
pan style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;co=
lor:#1f497d"><u></u>=C2=A0<u></u></span></a></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"m_8273620602523987487______replyseparator=
"></a><b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif">From:</span></b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif"> AKASH G J [mailto:<a href=3D"mailto:akashgj91@g=
mail.com" target=3D"_blank">akashgj91@gmail.com</a>]
<br>
<b>Sent:</b> Tuesday, August 7, 2018 3:13 AM<br>
<b>To:</b> Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"=
_blank">ed.tanous@intel.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: Phosphor Web-ui: Server unreachable<u></u><u></u></span=
></p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Ed,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Sorry for the late reply. I was on leave for last we=
ek.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am hosting phosphor-webui on a different machine a=
nd trying to connect the BMC board using its IP address. I am using bmcweb =
platform. When I tried to login, the following message appeared in browser =
console.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Cross-Origin Request Blocked: The Same Origin Policy=
 disallows reading the remote resource at
<a href=3D"https://%3cBMC-IP%3e/login" target=3D"_blank">https://&lt;BMC-IP=
&gt;/login</a>. (Reason: CORS request did not succeed).<br>
&lt;unavailable&gt; activity-stream.bundle.js:<wbr>3170:9<br>
CSI/tbsd_ cb=3Dgapi.loaded_0:458:127<br>
CSI/_tbnd cb=3Dgapi.loaded_0:458:127<br>
CSI/tbsd_ cb=3Dgapi.loaded_0:458:127<br>
CSI/_tbnd cb=3Dgapi.loaded_0:458:127<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks and Regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Akash<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Mon, Jul 30, 2018 at 11:06 PM, Ed Tanous &lt;<a h=
ref=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a=
>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">On 07/30/2018 05:04 AM, AKASH G J wrote:<u></u><u></=
u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Hi Team,<br>
<br>
I added phosphor-webui into the Linux image and set up client side of the w=
eb interface. In the client side of web interface I could able to give the =
IP address, username and password. After entering all those details, it is =
showing &quot;server unreachable&quot;. But
 I could able to ping the server board and ssh into the system. Please some=
one help to resolve the problem.<br>
<br>
<br>
<br>
Thanks and Regards,<br>
<br>
Akash G J<u></u><u></u></p>
</blockquote>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal">We need some basic information to help you troublesh=
oot.=C2=A0 You might also find faster responses on irc;=C2=A0 Most of the p=
eople involved in the web infrastructure are online there.<br>
<br>
1. What platform are you using?<br>
2. If not one of the upstream platforms, which web server is your platform =
using?=C2=A0 (probably one of phosphor-rest, bmcweb, or phosphor-rest+nginx=
)<br>
3. When you open up the debugger window in your chosen browser (usually the=
 F12 key) then go to the network tab and attempt to log in, what do you see=
?=C2=A0 You should see an attempt to get to the /login url, with some kind =
of error code (maybe 401, maybe 500,
 maybe something else).=C2=A0 We&#39;ll need that to help troubleshoot.<br>
4. Is there anything else strange about your setup that you might think wou=
ld contribute to your issue?<br>
5. Are you hosting phosphor-webui from a different machine from the BMC.=C2=
=A0 Depending on what server you are using, there are likely security setti=
ngs preventing cross site scripting that are blocking you.<u></u><u></u></p=
>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>
</div>

</blockquote></div><br></div>

--000000000000eae44e0572e5bcaf--
