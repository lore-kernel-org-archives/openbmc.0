Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Pchp1HSzzDqNF
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 04:43:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Mar 2019 10:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,249,1549958400"; d="scan'208";a="135737780"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 20 Mar 2019 10:43:17 -0700
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Thaju <tajudheenk@gmail.com>, Lei YU <mine260309@gmail.com>
Cc: xiuzhi <1450335857@qq.com>, ed <ed@tanous.net>,
 openbmc <openbmc@lists.ozlabs.org>, Eddie James <eajames@linux.vnet.ibm.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
 <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
 <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
 <CAARXrt=wgz7zqDWpx3inzBnMJJdxQ=b5ebLrna1H8A5kXc4r5w@mail.gmail.com>
 <2d44c252-94b6-6441-d3e8-a8200d89aaa5@linux.intel.com>
 <CAARXrtkkmxHcgvkp1Mi8esY0onqdHxRzaymcf8NaBZSM9uVYRQ@mail.gmail.com>
 <CAH2KKeajTT96Y6rOdKGct+EBLdbFxGo97SEfWzMrcu0hqRh_Hw@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <77cb1f2b-96c5-bd14-eab7-0da527343ce1@linux.intel.com>
Date: Wed, 20 Mar 2019 10:43:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAH2KKeajTT96Y6rOdKGct+EBLdbFxGo97SEfWzMrcu0hqRh_Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2019 17:43:23 -0000

Hi Thaju/Lei,

Check journal (journalctl -f) while you're testing KVM if there is any
suspicious error. In normal opration, you should see logs like below:

Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Got connection 
from client 127.0.0.1
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12   other clients:
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Normal socket 
connection
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Client Protocol 
Version 3.8
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Protocol version 
sent 3.8, using 3.8
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 
rfbProcessClientSecurityType: executing handler for type 1
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 
rfbProcessClientSecurityType: returning securityResult for client rfb 
version >= 3.8
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Pixel format for 
client 127.0.0.1:
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12   32 bpp, depth 
24, little endian
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12   true colour: 
max r 255 g 255 b 255, shift r 16 g 8 b 0
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Using image 
quality level 6 for client 127.0.0.1
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Using JPEG 
subsampling 0, Q79 for client 127.0.0.1
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Using 
compression level 2 for client 127.0.0.1
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Enabling 
NewFBSize protocol extension for client 127.0.0.1
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Enabling 
LastRect protocol extension for client 127.0.0.1
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 
rfbProcessClientNormalMessage: ignoring unsupported encoding type 
Enc(0xFFFFFEFE)
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 
rfbProcessClientNormalMessage: ignoring unsupported encoding type 
Enc(0xFFFFFECC)
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 
rfbProcessClientNormalMessage: ignoring unsupported encoding type 
Enc(0xFFFFFEC8)
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 
rfbProcessClientNormalMessage: ignoring unsupported encoding type 
Enc(0xFFFFFEC7)
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Enabling 
full-color cursor updates for client 127.0.0.1
Mar 19 16:17:12 wolfpass env[1331]: 19/03/2019 16:17:12 Using tight 
encoding for client 127.0.0.1
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19 Client 127.0.0.1 
gone
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19 Statistics 
       events    Transmit/ RawEquiv ( saved)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19 
FramebufferUpdate   :      1 |         0/        0 (  0.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19  LastRect 
     :     58 |       696/      696 (  0.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19  tight 
     :     58 |   1831655/182452920 ( 99.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19  RichCursor 
     :      1 |      1684/     1684 (  0.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19  TOTALS 
     :    118 |   1834035/182455300 ( 99.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19 Statistics 
       events    Received/ RawEquiv ( saved)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19  PointerEvent 
     :      3 |        18/       18 (  0.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19 
FramebufferUpdate   :     59 |       590/      590 (  0.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19  SetEncodings 
     :      1 |        68/       68 (  0.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19  SetPixelFormat 
     :      1 |        20/       20 (  0.0%)
Mar 19 16:17:19 wolfpass env[1331]: 19/03/2019 16:17:19  TOTALS 
     :     64 |       696/      696 (  0.0%)

Also, try these two patches. I added one more patch.
https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392
https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19433

If it doesn't make help, try external connection using Tight VNC viewer.
Currently, external connection is disabled by libvncserver's listening
ip setting so apply below patch if you are going to enable external
connection.

In obmc-ikvm package:
-----------------------
diff --git a/ikvm_server.cpp b/ikvm_server.cpp
index 35310da292be..b7bd5344ed0d 100644
--- a/ikvm_server.cpp
+++ b/ikvm_server.cpp
@@ -44,7 +44,7 @@ Server::Server(const Args& args, Input& i, Video& v) :
      server->cursor->xhot = 1;
      server->cursor->yhot = 1;

-    rfbStringToAddr(&ip[0], &server->listenInterface);
+    //rfbStringToAddr(&ip[0], &server->listenInterface);

      rfbInitServer(server);
-------------------------

Make sure that it's just for test purpose. We intentionally disabled
external connection because of security issue. Also, you might need to
use Tight VNC viewer only. I checked that other VNC viewers don't
support tight encoding properly.

Regards,
Jae


On 3/20/2019 4:12 AM, Thaju wrote:
> Hi Jae/Xiuzhi,
> 
> I have tried enabling KVM as mentioned in the mail thread. But unable to 
> get the video in the web. Also tried using vnc viewer, but connection 
> refused.
> 
> I see the following:
> 
> # obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p /dev/hidg1
> 26/02/2019 09:41:04 Unable to establish connection with systemd socket
> 26/02/2019 09:41:04 Listening for VNC connections on TCP port 5900
> 26/02/2019 09:41:04 Listening for VNC connections on TCP6 port 5900
> 26/02/2019 09:42:17 Got connection from client 127.0.0.1
> 26/02/2019 09:42:17   other clients:
> 26/02/2019 09:42:17 Normal socket connection
> 
> # dmesg | grep video
> [   18.921547] aspeed-video 1e700000.video: assigned reserved memory 
> node framebuffer
> [   59.799015] aspeed-video 1e700000.video: Timed out; first mode detect
> 
> obmc-ikvm recipe:
> 
> SUMMARY = "obmc kvm application"
> DESCRIPTION = "Interfaces video device and USB HID device on BMC"
> 
> FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"
> 
> inherit systemd
> inherit obmc-phosphor-systemd
> inherit autotools pkgconfig
> 
> LICENSE = "Apache-2.0"
> LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
> 
> PV = "1.0+git${SRCPV}"
> 
> SRC_URI = "git://github.com/openbmc/obmc-ikvm 
> <http://github.com/openbmc/obmc-ikvm> \
>          file://Fix_video_restarting_sync_issue.patch \
>          "
> SRCREV = "2bc661d34abd1fda92a9d2b256ed88ca0e90d09a"
> 
> DEPENDS += "autoconf-archive"
> DEPENDS += "libvncserver"
> DEPENDS += "sdbusplus"
> DEPENDS += "sdeventplus"
> DEPENDS += "phosphor-logging"
> DEPENDS += "phosphor-dbus-interfaces"
> DEPENDS += "systemd"
> 
> S = "${WORKDIR}/git"
> 
> SERVICE_FILE = "start-ipkvm.service"
> SYSTEMD_PACKAGES = "${PN}"
> SYSTEMD_SERVICE_${PN} += "${SERVICE_FILE}"
> SYSTEMD_DEFAULT_TARGET ?= "${SYSTEMD_DEFAULT_TARGET}"
> 
> What am I doing wrong here?
> Do we need to set "-DBMCWEB_ENABLE_KVM=ON" in bmcweb?
> 
> Regards,
> Thaj
> 
> On Wed, Mar 20, 2019 at 11:01 AM Lei YU <mine260309@gmail.com 
> <mailto:mine260309@gmail.com>> wrote:
> 
>      > Check if there are /dev/hidg0 and /dev/hidg1. If not, check kernel
>      > configs again.
>      > Also, check 'start-ipkvm.service' file whether that launches
>     obmc-ikvm
>      > using this options:
>      > ExecStart=/usr/bin/env obmc-ikvm -v /dev/video0 -f 10 -k
>     /dev/hidg0 -p
>      > /dev/hidg1
> 
>     Confirmed that both /dev/hidg0 and /dev/hidg1 are created, and the
>     service is
>     started with obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p /dev/hidg1.
> 
>      >
>      > Try this patch:
>      > https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392
> 
>     Unfortunately, the patch does not fix the issue, the KVM page still
>     shows a
>     small black block when browsed to another page and back.
> 
