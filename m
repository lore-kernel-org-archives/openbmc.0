Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QKjd3mhkzDqH5
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 08:31:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 14:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,254,1549958400"; d="scan'208";a="144096757"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga002.jf.intel.com with ESMTP; 21 Mar 2019 14:31:29 -0700
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Thaju <tajudheenk@gmail.com>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
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
 <77cb1f2b-96c5-bd14-eab7-0da527343ce1@linux.intel.com>
 <CAARXrtnAURfEDzTHZLHgOojRuD9T4DbUmuQLwvwsS4hvW-Sk_Q@mail.gmail.com>
 <bbc0ffe8-b30d-7d64-807a-b179a596a9ff@linux.intel.com>
 <CAH2KKeb2Jw+j4wOSEHY1HQwnyHxq9-9RSRKQ-shvdiBOvUf14w@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <97a9e5c4-c2d0-41bb-14ea-0405609929a2@linux.intel.com>
Date: Thu, 21 Mar 2019 14:31:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAH2KKeb2Jw+j4wOSEHY1HQwnyHxq9-9RSRKQ-shvdiBOvUf14w@mail.gmail.com>
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
X-List-Received-Date: Thu, 21 Mar 2019 21:31:34 -0000

Hi Thaju,

It's really good to hear that you can see the working KVM in your
machine. Thanks for sharing the result.

I saw the video waking up issue on Ubuntu 18 too. Need debugging on it.
I'll share if I find something.

Regards,
Jae

On 3/21/2019 9:27 AM, Thaju wrote:
> Hi Jae,
> 
> It works. Found one issue which is explained below.
> 
> I have applied below 3 patches:
> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392
> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19433
> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19393
> 
> I can confirm that:
> 1. KVM video appears fine in webui
> 2. All keyboard characters works fine.
> 3. Both mouse buttons works fine (with patch)
> 
> Now the issue is when host OS ( RHEL 7.5 in my case ) goes to power 
> saving mode (black screen) after some N mins (depends on OS settings), 
> looks like it does not accept the KVM HID events, it doesn't wake up 
> from power saving mode through KVM. I see below error when this happens.
> 
> Mar 21 09:31:43  obmc-ikvm[1408]: Failed to query timings
> Mar 21 09:31:43  kernel: aspeed-video 1e700000.video: Timed out; first 
> mode detect
> Mar 21 09:31:44  kernel: aspeed-video 1e700000.video: Timed out when 
> stopping streaming
> Mar 21 09:31:45  kernel: aspeed-video 1e700000.video: Timed out; first 
> mode detect
> Mar 21 09:31:46  kernel: aspeed-video 1e700000.video: Timed out; first 
> mode detect
> Mar 21 09:31:47  env[1408]: 21/03/2019 09:31:47 Sending 
> rfbEncodingNewFBSize for resize to (640x480)
> Mar 21 09:31:48  obmc-ikvm[1408]: Failed to query timings
> Mar 21 09:31:49  kernel: aspeed-video 1e700000.video: Timed out; first 
> mode detect
> Mar 21 09:31:50  obmc-ikvm[1408]: Failed to query timings
> Mar 21 09:31:51  kernel: aspeed-video 1e700000.video: Timed out; first 
> mode detect
> Mar 21 09:31:52  obmc-ikvm[1408]: Failed to query timings
> Mar 21 09:31:53  kernel: aspeed-video 1e700000.video: Timed out; first 
> mode detect
> 
> On this state, I used physical keyboard on the host OS to bring it back 
> from power saving mode and I see KVM also comes back. I have also tried 
> setting the power saving timeout to "never". It works fine.
> 
> To recreate this issue
> 1. Set power saving timeout to 1 min. (In RHEL 7.5, Settings > Power > 
> Blank Screen)
> 2. Leave the host OS to idle for 1 min.
> 3. You will see screen goes black after 1 min and KVM stops responding.
> 
> Hope you understood the issue. Thanks for your support.
> 
> Regards,
> Thaj
> 
> On Thu, Mar 21, 2019 at 9:49 PM Jae Hyun Yoo 
> <jae.hyun.yoo@linux.intel.com <mailto:jae.hyun.yoo@linux.intel.com>> wrote:
> 
>     Hi Lei,
> 
>     Are you using a web browser from Windows OS? It seems that there is an
>     issue of Windows websockify/novnc. Use a browser from OS other than
>     Windows til the issue is resolved.
> 
>     Did you test it using Tight VNC viewer after enabling external
>     connection? The reason why I suggested that is to identify whether
>     this issue comes from KVM web proxy or from KVM server.
> 
>     Need more information of your test environment.
>     Server platform:
>     BMC SoC:
>     Host OS:
> 
>     Regards,
>     Jae
> 
>     On 3/21/2019 12:02 AM, Lei YU wrote:
>      >> Check journal (journalctl -f) while you're testing KVM if there
>     is any
>      >> suspicious error. In normal opration, you should see logs like
>     below:
>      >
>      > I see the same logs as Thaj, only below logs show when the issue
>     occurs.
>      >
>      > Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Unable to
>      > establish connection with systemd socket
>      > Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Listening for
>      > VNC connections on TCP port 5900
>      > Mar 21 05:26:02 romulus env[1564]: 21/03/2019 05:26:02 Listening for
>      > VNC connections on TCP6 port 5900
>      > Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06 Got connection
>      > from client 127.0.0.1
>      > Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06   other
>     clients:
>      > Mar 21 05:26:06 romulus env[1564]: 21/03/2019 05:26:06 Normal
>     socket connection
>      >
>      > And sometimes it works, then I see logs like:
>      >
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Normal
>     socket connection
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Client
>     Protocol
>      > Version 3.8
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Protocol
>      > version sent 3.8, using 3.8
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12
>      > rfbProcessClientSecurityType: executing handler for type 1
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12
>      > rfbProcessClientSecurityType: returning securityResult for client rfb
>      > version >= 3.8
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Pixel format
>      > for client 192.168.10.11 <http://192.168.10.11>:
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12   32 bpp,
>     depth
>      > 24, little endian
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12   true colour:
>      > max r 255 g 255 b 255, shift r 16 g 8 b 0
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using
>      > compression level 1 for client 192.168.10.11
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using image
>      > quality level 6 for client 192.168.10.11
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using JPEG
>      > subsampling 0, Q79 for client 192.168.10.11
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
>      > X-style cursor updates for client 192.168.10.11
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
>      > full-color cursor updates for client 192.168.10.11
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
>     cursor
>      > position updates for client 192.168.10.11
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Enabling
>      > LastRect protocol extension for client 192.168.10.11
>      > Mar 21 06:54:12 romulus env[1957]: 21/03/2019 06:54:12 Using tight
>      > encoding for client 192.168.10.11
>      >
>      > It's found that the VNC server may work when the screen is
>     changed, e.g.
>      > reboot the OS, or enter the OS.
>      > When OS is in idle, usually it will not work.
>      >
>      >> Also, try these two patches. I added one more patch.
>      >> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392
>      >> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19433
>      >
>      > Tried the patches, still the same issue as above.
>      >
> 
