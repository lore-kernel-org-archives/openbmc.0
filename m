Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22d; helo=mail-oi0-x22d.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CTosBzmf"; 
 dkim-atps=neutral
Received: from mail-oi0-x22d.google.com (mail-oi0-x22d.google.com
 [IPv6:2607:f8b0:4003:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mNYS34kwzDqBy
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 19:41:15 +1000 (AEST)
Received: by mail-oi0-x22d.google.com with SMTP id b15-v6so8709074oib.10
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=knhLCrsJ6/3RwLWingxytJ1dmBuUjHo92gYmYihCCkM=;
 b=CTosBzmfZcEkgL94Sym+PCUqtdtW9ofGkr7LuqZiXCAW527Ia5GWG7hiMyEvRpWXkI
 mhVA2Q6ZarNqHnCkwl7eEn/5NKJ1aWAmLSw1nDkURX/j1XOEEcKXWTcba9TAye8uYjbq
 z7hytComS4+rcRMmxYjHhHV10UQ65eQk+77RVk2pFjtf4w5snoTy6jA+IS1gGIaNQ/hE
 lepBOhmBRoZ3GCVu3kIwKTkuk/MB/Sx7I1Md6ikFCBAApd43KKogvTD2w84bX4TWu8MW
 3N/hM71aGeiZVfxrm8GK/1RxaN7PRS01NSLwkDc1PH9rJcEb1SWq1xXJh9oO5Qck/4Sk
 Koiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=knhLCrsJ6/3RwLWingxytJ1dmBuUjHo92gYmYihCCkM=;
 b=pSVW82GXfP8sZosRyWH2vy2MaidHaYjYxBQgIBj4hJgL2U5VpYBLTTYa0BBxd5JnaZ
 zOevF0trkiF9Tb0nWTFtecJlk2tDN5brIWJeWDKvFSeo14I7tlfGymQsgVyQAOiPYiW7
 6STx4etqEL+Qf0FzHVydC8iK+ON4KVykItsN7lsHdRV4Qeg+deLkNA+sBwKBxR/JePgH
 cODnOIQ4nPtzdnBCsev3K+nOvIgmOggbGGtAQtzcAaQOAz8bYQAkJUsOSmN8qy1OuTOm
 Gy2f9gBeS42eWYrwvoSxjILS/RleIeZmJ1rUA2vEuAdCrru/TvZJqV4mm++n92jxYuZ4
 jFvw==
X-Gm-Message-State: AOUpUlHJ4AzluUUmfTS5XDbBOmwqsOgnG3HyEsIrfKQnhr6NTgVOrfqI
 XCZagZuKX7lOCz69jVoyVT2Tt/bT2XiGgWeS/34=
X-Google-Smtp-Source: AA+uWPzXyFAqvhvDdLhF2361De56GZWtTe8sLabyoH8x1wmXa0IiyRWKLpujl4KEDD/rf1yIlGcrN5J9ROWC5kamIO4=
X-Received: by 2002:a54:4784:: with SMTP id
 o4-v6mr1395171oic.101.1533807672235; 
 Thu, 09 Aug 2018 02:41:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c4a:0:0:0:0:0 with HTTP;
 Thu, 9 Aug 2018 02:41:11 -0700 (PDT)
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169934582EA93@ORSMSX114.amr.corp.intel.com>
References: <CAE33tLFQ6v2n2tBavZVJmHdYK1cFmFFhKRb9_8RG3xS4xzr6ug@mail.gmail.com>
 <25bebbd3-7df8-f396-ef62-0b846e3435aa@intel.com>
 <CAE33tLHsd5HwrCS9qLXO6Mo_gzka1Mrv7vs3Ofy0AF=YRJdT1w@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345827A58@ORSMSX114.amr.corp.intel.com>
 <CAE33tLGtRSdcYgvavfR2Ezkk7XduS9jEkJuez5WYBiLe-AHN2A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169934582EA93@ORSMSX114.amr.corp.intel.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 9 Aug 2018 15:11:11 +0530
Message-ID: <CAE33tLGu+TqAnZfG73tPpL=oH+Bk_g4T7a5vE5Rean8DENk_=g@mail.gmail.com>
Subject: Re: Phosphor Web-ui: Server unreachable
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000751c810572fd6dd9"
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
X-List-Received-Date: Thu, 09 Aug 2018 09:41:18 -0000

--000000000000751c810572fd6dd9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding the lines

req.addHeader(=E2=80=9CAccess-Control-Allow-Origin=E2=80=9D, =E2=80=9C*=E2=
=80=9D);

req.addHeader(=E2=80=9CAccess-Control-Allow-Methods=E2=80=9D, =E2=80=9CGET,=
 POST, PUT, PATCH=E2=80=9D); to
the file https://github.com/openbmc/bmcweb/blob/master/include/
security_headers_middleware.hpp gives error in compilation of bmcweb. The
following are some error messages I got.


|
/home/akash/Pictures/openbmcNew/openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/bmcweb/1.0+gitAUTOINC+55c7b7a2e5-r0/git/include/security_headers_mi=
ddleware.hpp:44:20:
error: stray '\200' in program
|      req.addHeader(=E2=80=9CAccess-Control-Allow-Origin=E2=80=9D, =E2=80=
=9C*=E2=80=9D);


|
/home/akash/Pictures/openbmcNew/openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/bmcweb/1.0+gitAUTOINC+55c7b7a2e5-r0/git/include/security_headers_mi=
ddleware.hpp:45:9:
error: 'struct crow::Request' has no member named 'addHeader'
|      req.addHeader(=E2=80=9CAccess-Control-Allow-Methods=E2=80=9D, =E2=80=
=9CGET, POST, PUT,
PATCH=E2=80=9D);


|
/home/akash/Pictures/openbmcNew/openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/bmcweb/1.0+gitAUTOINC+55c7b7a2e5-r0/git/include/security_headers_mi=
ddleware.hpp:45:43:
error: 'Methods' was not declared in this scope
|      req.addHeader(=E2=80=9CAccess-Control-Allow-Methods=E2=80=9D, =E2=80=
=9CGET, POST, PUT,
PATCH=E2=80=9D);
|                                            ^~~~~~~
|
/home/akash/Pictures/openbmcNew/openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/bmcweb/1.0+gitAUTOINC+55c7b7a2e5-r0/git/include/security_headers_mi=
ddleware.hpp:45:58:
error: 'GET' was not declared in this scope
|      req.addHeader(=E2=80=9CAccess-Control-Allow-Methods=E2=80=9D, =E2=80=
=9CGET, POST, PUT,
PATCH=E2=80=9D);



Thanks and Regards,


Akash G J


On Wed, Aug 8, 2018 at 8:43 PM, Tanous, Ed <ed.tanous@intel.com> wrote:

> That looks like you=E2=80=99re trying to build a version of bmcweb from a=
 couple
> months ago (SHA1 f4c4dcf438) which still requires boost-dbus.  Can you
> try building off the latest?
>
>
>
> https://github.com/openbmc/openbmc/blob/master/meta-
> phosphor/common/recipes-phosphor/interfaces/bmcweb.bb
>
>
>
> It should get rid of the problem below.
>
>
>
> -Ed
>
>
>
> *From:* AKASH G J [mailto:akashgj91@gmail.com]
> *Sent:* Tuesday, August 7, 2018 10:25 PM
>
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
> I made the changes suggested by you. But in building the system, I am
> getting some configuration error. Please find the following log data.
>
>
>
> Log data follows:
> | DEBUG: Executing shell function do_configure
> | CMAKE_MODULE_PATH=3D/home/akash/Pictures/openbmc/build/tmp/
> work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+
> f4c4dcf438-r0/git/cmake
> | -- The CXX compiler identification is GNU 7.3.0
> | -- The C compiler identification is GNU 7.3.0
> | -- Check for working CXX compiler: /home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/
> arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++
> | -- Check for working CXX compiler: /home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/
> arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++ -- works
> | -- Detecting CXX compiler ABI info
> | -- Detecting CXX compiler ABI info - done
> | -- Detecting CXX compile features
> | -- Detecting CXX compile features - done
> | -- Check for working C compiler: /home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/
> arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-gcc
> | -- Check for working C compiler: /home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/recipe-sysroot-native/usr/bin/
> arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-gcc -- works
> | -- Detecting C compiler ABI info
> | -- Detecting C compiler ABI info - done
> | -- Detecting C compile features
> | -- Detecting C compile features - done
> | -- Boost version: 1.64.0
> | -- Found OpenSSL: /home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libcrypto.so (found
> version "1.0.2n")
> | OPENSSL_INCLUDE_DIR /home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/include
> | CMAKE_BUILD_TYPE=3D
> | -- Found ZLIB: /home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libz.so (found version
> "1.2.11")
> | -- Performing Test PAM_MESSAGE_CONST
> | -- Performing Test PAM_MESSAGE_CONST - Success
> | -- Found PAM: /home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc=
-
> linux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/
> recipe-sysroot/lib/libpam.so;/home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/recipe-sysroot/usr/lib/libdl.so
> | -- Configuring done
> | CMake Error in CMakeLists.txt:
> |
>
> * Imported target "boost-dbus" includes non-existent path | |
> "/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/=
boost-dbus/1.0+gitAUTOINC+70f79f4d66-r0/recipe-sysroot/usr/include/dbus-1.0=
"*
> |
> |   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:
> |
> |   * The path was deleted, renamed, or moved to another location.
> |
> |   * An install or uninstall procedure did not complete successfully.
> |
> |   * The installation package was faulty and references files it does no=
t
> |   provide.
> |
> |
> |
> | CMake Error in CMakeLists.txt:
> |
>
> * Imported target "boost-dbus" includes non-existent path | |
> "/home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/=
boost-dbus/1.0+gitAUTOINC+70f79f4d66-r0/recipe-sysroot/usr/include/dbus-1.0=
"*
> |
> |   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:
> |
> |   * The path was deleted, renamed, or moved to another location.
> |
> |   * An install or uninstall procedure did not complete successfully.
> |
> |   * The installation package was faulty and references files it does no=
t
> |   provide.
> |
> |
> |
> | -- Generating done
> | CMake Warning:
> |   Manually-specified variables were not used by the project:
> |
> |     CMAKE_INSTALL_BINDIR
> |     CMAKE_INSTALL_DATAROOTDIR
> |     CMAKE_INSTALL_INCLUDEDIR
> |     CMAKE_INSTALL_LIBDIR
> |     CMAKE_INSTALL_LIBEXECDIR
> |     CMAKE_INSTALL_LOCALSTATEDIR
> |     CMAKE_INSTALL_SBINDIR
> |     CMAKE_INSTALL_SHAREDSTATEDIR
> |     CMAKE_INSTALL_SYSCONFDIR
> |
> |
> | -- Build files have been written to: /home/akash/Pictures/openbmc/
> build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+
> gitAUTOINC+f4c4dcf438-r0/build
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /home/akash/Pictures/openbmc/build/tmp/work/armv6-openbmc-
> linux-gnueabi/bmcweb/1.0+gitAUTOINC+f4c4dcf438-r0/temp/
> log.do_configure.17054)
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
> Akash G J
>
>
>
> On Tue, Aug 7, 2018 at 7:54 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>
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
>
>

--000000000000751c810572fd6dd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Adding the lines <p class=3D"MsoNormal"><span style=
=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif;color:rgb(31,=
73,125)">req.addHeader(=E2=80=9CAccess-Control-<wbr>Allow-Origin=E2=80=9D, =
=E2=80=9C*=E2=80=9D);<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif;color:rgb(31,73,125)">req.addHeader(=E2=80=9CAccess-Co=
ntrol-<wbr>Allow-Methods=E2=80=9D, =E2=80=9CGET, POST, PUT, PATCH=E2=80=9D)=
; <span style=3D"color:rgb(0,0,0)">to the file</span> <span><a href=3D"http=
s://github.com/openbmc/bmcweb/blob/master/include/security_headers_middlewa=
re.hpp" target=3D"_blank">https://github.com/openbmc/<wbr>bmcweb/blob/maste=
r/include/<wbr>security_headers_middleware.<wbr>hpp</a></span> <span style=
=3D"color:rgb(0,0,0)">gives error in compilation of bmcweb. The following a=
re some error messages I got.</span></span></p><p class=3D"MsoNormal"><span=
 style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif;color:r=
gb(31,73,125)"><br></span></p><p class=3D"MsoNormal"><span style=3D"font-si=
ze:11pt;font-family:&quot;Calibri&quot;,sans-serif;color:rgb(31,73,125)">| =
/home/akash/Pictures/openbmcNew/openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/bmcweb/1.0+gitAUTOINC+55c7b7a2e5-r0/git/include/security_headers_mi=
ddleware.hpp:44:20: error: stray &#39;\200&#39; in program<br>|=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 req.addHeader(=E2=80=9CAccess-Control-Allow-Origin=E2=80=
=9D, =E2=80=9C*=E2=80=9D);<br></span></p><p class=3D"MsoNormal"><span style=
=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif;color:rgb(31,=
73,125)"><br></span></p><p class=3D"MsoNormal"><span style=3D"font-size:11p=
t;font-family:&quot;Calibri&quot;,sans-serif;color:rgb(31,73,125)">| /home/=
akash/Pictures/openbmcNew/openbmc/build/tmp/work/armv6-openbmc-linux-gnueab=
i/bmcweb/1.0+gitAUTOINC+55c7b7a2e5-r0/git/include/security_headers_middlewa=
re.hpp:45:9: error: &#39;struct crow::Request&#39; has no member named &#39=
;addHeader&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req.addHeader(=E2=80=9CA=
ccess-Control-Allow-Methods=E2=80=9D, =E2=80=9CGET, POST, PUT, PATCH=E2=80=
=9D);<br></span></p><p class=3D"MsoNormal"><span style=3D"font-size:11pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;color:rgb(31,73,125)"><br></span><=
/p><p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:rgb(31,73,125)">| /home/akash/Pictures/openbm=
cNew/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOI=
NC+55c7b7a2e5-r0/git/include/security_headers_middleware.hpp:45:43: error: =
&#39;Methods&#39; was not declared in this scope<br>|=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 req.addHeader(=E2=80=9CAccess-Control-Allow-Methods=E2=80=9D, =E2=
=80=9CGET, POST, PUT, PATCH=E2=80=9D);<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~<br>| /home/akash/Pictures/openbmcNew/openbmc/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+55c7b7a2e5-r0/git/include/se=
curity_headers_middleware.hpp:45:58: error: &#39;GET&#39; was not declared =
in this scope<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req.addHeader(=E2=80=9CAcc=
ess-Control-Allow-Methods=E2=80=9D, =E2=80=9CGET, POST, PUT, PATCH=E2=80=9D=
);</span></p><p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-fami=
ly:&quot;Calibri&quot;,sans-serif;color:rgb(31,73,125)"><br></span></p><p c=
lass=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Calibri&=
quot;,sans-serif;color:rgb(31,73,125)"><br></span></p><p class=3D"MsoNormal=
"><span style=3D"color:rgb(0,0,0)"><span style=3D"font-size:11pt;font-famil=
y:&quot;Calibri&quot;,sans-serif">Thanks and Regards,</span></span></p><p c=
lass=3D"MsoNormal"><span style=3D"color:rgb(0,0,0)"><span style=3D"font-siz=
e:11pt;font-family:&quot;Calibri&quot;,sans-serif"><br></span></span></p><p=
 class=3D"MsoNormal"><span style=3D"color:rgb(0,0,0)"><span style=3D"font-s=
ize:11pt;font-family:&quot;Calibri&quot;,sans-serif">Akash G J<br></span></=
span></p><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Wed, Aug 8, 2018 at 8:43 PM, Tanous, Ed <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div link=3D"blue" vlink=3D"purple" lang=3D"EN-US">
<div class=3D"m_8745085126690121212WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">That looks like you=E2=80=99re trying=
 to build a version of bmcweb from a couple months ago (SHA1 f4c4dcf438)</s=
pan>
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;=
color:#1f497d">which still requires boost-dbus.=C2=A0 Can you try building =
off the latest?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><a href=3D"https://github.com/openbmc=
/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/interfaces/bmcwe=
b.bb" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/blob/master=
/meta-<wbr>phosphor/common/recipes-<wbr>phosphor/interfaces/bmcweb.bb</a><u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">It should get rid of the problem belo=
w.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">-Ed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> AKASH G J [mailto:<a href=3D"m=
ailto:akashgj91@gmail.com" target=3D"_blank">akashgj91@gmail.com</a>]
<br>
<b>Sent:</b> Tuesday, August 7, 2018 10:25 PM</span></p><div><div class=3D"=
h5"><br>
<b>To:</b> Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"=
_blank">ed.tanous@intel.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: Phosphor Web-ui: Server unreachable<u></u><u></u></div>=
</div><p></p>
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
<p class=3D"MsoNormal">I made the changes suggested by you. But in building=
 the system, I am getting some configuration error. Please find the followi=
ng log data.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Log data follows:<br>
| DEBUG: Executing shell function do_configure<br>
| CMAKE_MODULE_PATH=3D/home/akash/<wbr>Pictures/openbmc/build/tmp/<wbr>work=
/armv6-openbmc-linux-<wbr>gnueabi/bmcweb/1.0+gitAUTOINC+<wbr>f4c4dcf438-r0/=
git/cmake<br>
| -- The CXX compiler identification is GNU 7.3.0<br>
| -- The C compiler identification is GNU 7.3.0<br>
| -- Check for working CXX compiler: /home/akash/Pictures/openbmc/<wbr>buil=
d/tmp/work/armv6-openbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4=
dcf438-r0/<wbr>recipe-sysroot-native/usr/bin/<wbr>arm-openbmc-linux-gnueabi=
/arm-<wbr>openbmc-linux-gnueabi-g++<br>
| -- Check for working CXX compiler: /home/akash/Pictures/openbmc/<wbr>buil=
d/tmp/work/armv6-openbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4=
dcf438-r0/<wbr>recipe-sysroot-native/usr/bin/<wbr>arm-openbmc-linux-gnueabi=
/arm-<wbr>openbmc-linux-gnueabi-g++ -- works<br>
| -- Detecting CXX compiler ABI info<br>
| -- Detecting CXX compiler ABI info - done<br>
| -- Detecting CXX compile features<br>
| -- Detecting CXX compile features - done<br>
| -- Check for working C compiler: /home/akash/Pictures/openbmc/<wbr>build/=
tmp/work/armv6-openbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4dc=
f438-r0/<wbr>recipe-sysroot-native/usr/bin/<wbr>arm-openbmc-linux-gnueabi/a=
rm-<wbr>openbmc-linux-gnueabi-gcc<br>
| -- Check for working C compiler: /home/akash/Pictures/openbmc/<wbr>build/=
tmp/work/armv6-openbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4dc=
f438-r0/<wbr>recipe-sysroot-native/usr/bin/<wbr>arm-openbmc-linux-gnueabi/a=
rm-<wbr>openbmc-linux-gnueabi-gcc -- works<br>
| -- Detecting C compiler ABI info<br>
| -- Detecting C compiler ABI info - done<br>
| -- Detecting C compile features<br>
| -- Detecting C compile features - done<br>
| -- Boost version: 1.64.0<br>
| -- Found OpenSSL: /home/akash/Pictures/openbmc/<wbr>build/tmp/work/armv6-=
openbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4dcf438-r0/<wbr>re=
cipe-sysroot/usr/lib/<wbr>libcrypto.so (found version &quot;1.0.2n&quot;)<b=
r>
| OPENSSL_INCLUDE_DIR /home/akash/Pictures/openbmc/<wbr>build/tmp/work/armv=
6-openbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4dcf438-r0/<wbr>=
recipe-sysroot/usr/include<br>
| CMAKE_BUILD_TYPE=3D<br>
| -- Found ZLIB: /home/akash/Pictures/openbmc/<wbr>build/tmp/work/armv6-ope=
nbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4dcf438-r0/<wbr>recip=
e-sysroot/usr/lib/libz.so (found version &quot;1.2.11&quot;)<br>
| -- Performing Test PAM_MESSAGE_CONST<br>
| -- Performing Test PAM_MESSAGE_CONST - Success<br>
| -- Found PAM: /home/akash/Pictures/openbmc/<wbr>build/tmp/work/armv6-open=
bmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4dcf438-r0/<wbr>recipe=
-sysroot/lib/libpam.so;/<wbr>home/akash/Pictures/openbmc/<wbr>build/tmp/wor=
k/armv6-openbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4c4dcf438-r0=
/<wbr>recipe-sysroot/usr/lib/libdl.<wbr>so<br>
| -- Configuring done<br>
| CMake Error in CMakeLists.txt:<br>
|=C2=A0=C2=A0<b> Imported target &quot;boost-dbus&quot; includes non-existe=
nt path<br>
| <br>
|=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/home/akash/Pictures/openbmc/<wbr>build/tmp=
/work/armv6-openbmc-<wbr>linux-gnueabi/boost-dbus/1.0+<wbr>gitAUTOINC+70f79=
f4d66-r0/<wbr>recipe-sysroot/usr/include/<wbr>dbus-1.0&quot;</b><br>
| <br>
|=C2=A0=C2=A0 in its INTERFACE_INCLUDE_DIRECTORIES.<wbr>=C2=A0 Possible rea=
sons include:<br>
| <br>
|=C2=A0=C2=A0 * The path was deleted, renamed, or moved to another location=
.<br>
| <br>
|=C2=A0=C2=A0 * An install or uninstall procedure did not complete successf=
ully.<br>
| <br>
|=C2=A0=C2=A0 * The installation package was faulty and references files it=
 does not<br>
|=C2=A0=C2=A0 provide.<br>
| <br>
| <br>
| <br>
| CMake Error in CMakeLists.txt:<br>
|=C2=A0=C2=A0<b> Imported target &quot;boost-dbus&quot; includes non-existe=
nt path<br>
| <br>
|=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/home/akash/Pictures/openbmc/<wbr>build/tmp=
/work/armv6-openbmc-<wbr>linux-gnueabi/boost-dbus/1.0+<wbr>gitAUTOINC+70f79=
f4d66-r0/<wbr>recipe-sysroot/usr/include/<wbr>dbus-1.0&quot;</b><br>
| <br>
|=C2=A0=C2=A0 in its INTERFACE_INCLUDE_DIRECTORIES.<wbr>=C2=A0 Possible rea=
sons include:<br>
| <br>
|=C2=A0=C2=A0 * The path was deleted, renamed, or moved to another location=
.<br>
| <br>
|=C2=A0=C2=A0 * An install or uninstall procedure did not complete successf=
ully.<br>
| <br>
|=C2=A0=C2=A0 * The installation package was faulty and references files it=
 does not<br>
|=C2=A0=C2=A0 provide.<br>
| <br>
| <br>
| <br>
| -- Generating done<br>
| CMake Warning:<br>
|=C2=A0=C2=A0 Manually-specified variables were not used by the project:<br=
>
| <br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_BINDIR<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_DATAROOTDIR<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_INCLUDEDIR<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_LIBDIR<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_LIBEXECDIR<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_LOCALSTATEDIR<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_SBINDIR<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_SHAREDSTATEDIR<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 CMAKE_INSTALL_SYSCONFDIR<br>
| <br>
| <br>
| -- Build files have been written to: /home/akash/Pictures/openbmc/<wbr>bu=
ild/tmp/work/armv6-openbmc-<wbr>linux-gnueabi/bmcweb/1.0+<wbr>gitAUTOINC+f4=
c4dcf438-r0/build<br>
| WARNING: exit code 1 from a shell command.<br>
| ERROR: Function failed: do_configure (log file is located at /home/akash/=
Pictures/openbmc/<wbr>build/tmp/work/armv6-openbmc-<wbr>linux-gnueabi/bmcwe=
b/1.0+<wbr>gitAUTOINC+f4c4dcf438-r0/temp/<wbr>log.do_configure.17054)<u></u=
><u></u></p>
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
<p class=3D"MsoNormal">Akash G J<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Tue, Aug 7, 2018 at 7:54 PM, Tanous, Ed &lt;<a hr=
ef=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a>=
&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">This a security measure in bmcweb to =
prevent cross site scripting.=C2=A0 If you=E2=80=99re running phosphor-webu=
i
 from another machine, you=E2=80=99re essentially running cross site script=
ing as a development measure, which is exactly what the BMC sees, and the b=
rowser squashes the request as a suspected XSS attack.</span><u></u><u></u>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">The easiest way to make this work for=
 testing is to go to this file:</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><a href=3D"https://github.com/openbmc=
/bmcweb/blob/master/include/security_headers_middleware.hpp" target=3D"_bla=
nk">https://github.com/openbmc/<wbr>bmcweb/blob/master/include/<wbr>securit=
y_headers_middleware.<wbr>hpp</a></span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">and comment out lines 42-44, which se=
t headers to prevent the bmc squashing the request.</span><u></u><u></u></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">It=E2=80=99s been a while since I=E2=
=80=99ve developed like that, but you likely also need to add a couple head=
ers
 as well</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">req.addHeader(=E2=80=9CAccess-Control=
-<wbr>Allow-Origin=E2=80=9D, =E2=80=9C*=E2=80=9D);</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">req.addHeader(=E2=80=9CAccess-Control=
-<wbr>Allow-Methods=E2=80=9D, =E2=80=9CGET, POST, PUT, PATCH=E2=80=9D);</sp=
an><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">I know you=E2=80=99re not the first p=
erson to hit this unexpectedly.=C2=A0 If you get a header recipe that allow=
s
 development, it would be great if you could codify it into an option calle=
d BMC_INSECURE_ALLOW_XSS, add it to the build configuration, and put it up =
for a gerrit review;=C2=A0 I=E2=80=99m fairly certain it would help others.=
</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">-Ed</span><u></u><u></u></p>
<p class=3D"MsoNormal"><a name=3D"m_8745085126690121212_m_82736206025239874=
87__MailEndCompose"><span style=3D"font-size:11.0pt;font-family:&quot;Calib=
ri&quot;,sans-serif;color:#1f497d">=C2=A0</span></a><u></u><u></u></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"m_8745085126690121212_m_82736206025239874=
87______replyseparato"></a><b><span style=3D"font-size:11.0pt;font-family:&=
quot;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.=
0pt;font-family:&quot;Calibri&quot;,sans-serif">
 AKASH G J [mailto:<a href=3D"mailto:akashgj91@gmail.com" target=3D"_blank"=
>akashgj91@gmail.com</a>]
<br>
<b>Sent:</b> Tuesday, August 7, 2018 3:13 AM<br>
<b>To:</b> Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"=
_blank">ed.tanous@intel.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: Phosphor Web-ui: Server unreachable</span><u></u><u></u=
></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Ed,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Sorry for the late reply. I was on leave for last we=
ek.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am hosting phosphor-webui on a different machine a=
nd trying to connect the BMC board using its IP address. I am using bmcweb =
platform. When I tried to login, the following message
 appeared in browser console.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
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
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks and Regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Akash<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">On Mon, Jul 30, 2018 at 11:06 PM, Ed Tanous &lt;<a h=
ref=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a=
>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"MsoNormal">On 07/30/2018 05:04 AM, AKASH G J wrote:<u></u><u></=
u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
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
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
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
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>
</div>

</blockquote></div><br></div>

--000000000000751c810572fd6dd9--
