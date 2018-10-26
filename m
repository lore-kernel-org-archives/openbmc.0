Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hgqb1lhRzF3Ht
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 10:55:54 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w9QNtdDA021661;
 Fri, 26 Oct 2018 18:55:40 -0500
Message-ID: <f159becabdbbd1daf3517accdfe2d51f4bb04f82.camel@kernel.crashing.org>
Subject: Re: Re: VHUB didn't work on AST2500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: xiuzhi <1450335857@qq.com>, Eddie James <eajames@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>
Cc: openbmc <openbmc@lists.ozlabs.org>, "Alexander A. Filippov"
 <a.filippov@yadro.com>
Date: Sat, 27 Oct 2018 10:55:38 +1100
In-Reply-To: <tencent_2D44968D30021E8C093CB1BE@qq.com>
References: <tencent_2D44968D30021E8C093CB1BE@qq.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 26 Oct 2018 23:55:56 -0000

On Fri, 2018-10-26 at 14:34 +0800, xiuzhi wrote:
> Hi Eddie,
>    Thanks for your reply.  
> It seemd that the error was caused by the  version dismatch of kernel ,libvncserver ,obmc-ikvm and  vnc client. 
> Would you like to give me your  git commits numbers of them?

It's still a very strange error.

Once everything is up to date, let me know if it occurs again, there's
something not right going on in the vhub driver causing that state
mismatch error, it shouldn't happen. But I haven't managed to reproduce
it here.

Cheers,
Ben.

> Best,
> xiuzhi  
> On 10/24/2018 09:52 PM, xiuzhi wrote:
> > Hi Ben,
> >   I use vncviewer , xtightvncviewer 1.3.9-6.4ubuntu1.
> > And I also tested the ikvm by webui 
> > vnc(_https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/_) 
> > ,the same errors occured.
> > The same source code obmc-ikvm and this  kernel branch video-dev5  
> > works on my other  AST2400 hardware machine.
> > I remembered  only one  kernel version seemed to work on ast2500 ,I 
> > tested it six weeks ago .
> >  the kernel version is:
> >
> > KBRANCH ?= "video-dev"
> > LINUX_VERSION ?= "4.17.11"
> > SRCREV="09a65900b2fc7aab9caf9d0dfabc7ba80525b1dd"
> > the git repo is from  git://github.com/eddiejames/linux/,
> >
> > https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11500/5/meta-openbmc-bsp/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb
> > I want to test this kernel version ,but now this git repo is not 
> > available ,
> >  I asked Eddiejames week ago, and get no response until now .
> >  It is so bad that I did not  backup this kernel on my local machice.
> 
> I never made any kernel changes related to USB in my github trees, as 
> far as I know, so shouldn't be any difference. That original gerrit 
> commit was purely for our testing purposes for our system... not really 
> something I can support actively.
> 
> I have a number of commits pending review that you could try and pull in 
> if you really need this now:
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/13536/
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-aspeed/+/13541/
> https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/12126/
> https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/13888/
> 
> Use these in combination with the two commits at the top of my video-dev 
> linux tree for your kernel.
> 
> Thanks,
> Eddie
> 
> >
> > Best.
> > Xiuzhi
> > On Thu, 2018-10-25 at 09:39 +0800, xiuzhi wrote:
> > > Hi Ben,
> > >   I open the CONFIG_USB_GADGET_DEBUG .
> > > and input the following keys by order:
> > > ';''Enter' :work good,can see ';' on host screen
> > > 'a''Enter' :error,see anything on screen
> > > 'b''Enter' :error,see anything on screen
> > > '1''Enter' :good
> > > '2''Enter' :good
> > > '3''Enter' :good
> > > '4''Enter' :good
> > > '5''Enter'  :error deadlock
> > > The log is:
> >
> > Can you tell me more about the userspace components you use to send
> > those keys ? I'd like to try to reproduce here.
> >
> > > [   78.820671] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request() 
> > failed for pin 67
> > > [   78.828274] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67 
> > (1e780000.gpio:347) status -1
> > > [   80.698564] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request() 
> > failed for pin 67
> > > [   80.706166] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67 
> > (1e780000.gpio:347) status -
> > > [   94.447816] udc 1e6a0000.usb-vhub:p1: registering UDC driver 
> > [obmc_hid]
> > > [   94.447909] configfs-gadget gadget: adding 'hid'/15e5a204 to 
> > config 'c'/70dd0747
> > > [   94.447940] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> > > [   94.447958] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen 
> > EP 0 for addr 1
> > > [   94.448474] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#0 
> > for port EP1
> > > [   94.448505] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> > > [   94.448522] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen 
> > EP 1 for addr 2
> > > [   94.448780] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#1 
> > for port EP2
> > > [   94.449270] aspeed_vhub 1e6a0000.usb-vhub: port1 start
> > > [   94.449297] aspeed_vhub 1e6a0000.usb-vhub: port1 pullup(1)
> > > [   94.449317] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 
> > 0000 -> 0001 (C=1)
> > > [  100.158377] aspeed_vhub 1e6a0000.usb-vhub: USB bus resume
> > > [  100.158400] configfs-gadget gadget: resume
> > > [  100.158415] aspeed_vhub 1e6a0000.usb-vhub: USB bus reset
> > > [  100.301048] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 00/05/0002/0000/0000 [out] st=0
> > > [  100.301081] aspeed_vhub 1e6a0000.usb-vhub: USB status=0b100000 
> > speed=high
> > > [  100.301096] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SET_ADDRESS: 
> > Got address 2
> > > [  100.322061] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 80/06/0100/0000/0008 [in] st=0
> > > [  100.322090] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > GET_DESCRIPTOR(type:1)
> > > [  100.326625] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 80/06/0100/0000/0012 [in] st=0
> > > [  100.326656] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > GET_DESCRIPTOR(type:1)
> > > [  100.331359] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 80/06/0200/0000/0008 [in] st=0
> > > [  100.331392] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > GET_DESCRIPTOR(type:2)
> > > [  100.335194] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 80/06/0200/0000/0019 [in] st=0
> > > [  100.335221] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > GET_DESCRIPTOR(type:2)
> > > [  100.343939] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 80/06/0300/0000/0002 [in] st=0
> > > [  100.344272] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 80/06/0300/0000/0004 [in] st=0
> > > [  100.344647] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 00/09/0001/0000/0000 [out] st=0
> > > [  100.378145] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > a0/06/2900/0000/0002 [in] st=0
> > > [  100.378178] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > GetHubDescriptor(0)
> > > [  100.378195] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > GET_DESCRIPTOR(type:41)
> > > [  100.378522] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > a0/06/2900/0000/0009 [in] st=0
> > > [  100.378546] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > GetHubDescriptor(0)
> > > [  100.378560] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > GET_DESCRIPTOR(type:41)
> > > [  100.382665] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/03/0008/0001/0000 [out] st=0
> > > [  100.382697] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > SetPortFeature(1,8)
> > > [  100.382896] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/03/0008/0002/0000 [out] st=0
> > > [  100.382922] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > SetPortFeature(2,8)
> > > [  100.383148] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/03/0008/0003/0000 [out] st=0
> > > [  100.383173] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > SetPortFeature(3,8)
> > > [  100.383396] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/03/0008/0004/0000 [out] st=0
> > > [  100.383422] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > SetPortFeature(4,8)
> > > [  100.383643] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/03/0008/0005/0000 [out] st=0
> > > [  100.383668] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > SetPortFeature(5,8)
> > > [  100.403844] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > a0/00/0000/0000/0004 [in] st=0
> > > [  100.403871] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> > > [  100.549225] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > a3/00/0000/0001/0004 [in] st=0
> > > [  100.549257] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> > > [  100.549275] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port 
> > status=0101 change=0001
> > > [  100.549651] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/01/0010/0001/0000 [out] st=0
> > > [  100.549681] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > ClearPortFeature(1,16)
> > > [  100.664592] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/03/0004/0001/0000 [out] st=0
> > > [  100.664625] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > SetPortFeature(1,4)
> > > [  100.664639] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 Port reset !
> > > [  100.664658] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 
> > 0001 -> 0011 (C=0)
> > > [  100.664672] aspeed_vhub 1e6a0000.usb-vhub: port1 Reset at unknown 
> > speed of disabled device, enabling.
> > > [  100.664689] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 
> > 0011 -> 0403 (C=1)
> > > [  100.684840] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > a3/00/0000/0001/0004 [in] st=0
> > > [  100.684867] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> > > [  100.684885] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port 
> > status=0503 change=0012
> > > [  100.685276] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/01/0011/0001/0000 [out] st=0
> > > [  100.685306] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > ClearPortFeature(1,17)
> > > [  100.685518] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > 23/01/0014/0001/0000 [out] st=0
> > > [  100.685544] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > ClearPortFeature(1,20)
> > > [  100.698539] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 00/05/0003/0000/0000 [out] st=0
> > > [  100.698568] aspeed_vhub 1e6a0000.usb-vhub: port1 fist packet, 
> > captured speed 3
> > > [  100.698585] aspeed_vhub 1e6a0000.usb-vhub: port1 SET_ADDRESS: Got 
> > address 3
> > > [  100.714314] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > a3/00/0000/0001/0004 [in] st=0
> > > [  100.714339] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> > > [  100.714354] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port 
> > status=0503 change=0000
> > > [  100.729165] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 80/06/0100/0000/0008 [in] st=0
> > > [  100.729195] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.729227] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.733627] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 80/06/0100/0000/0012 [in] st=0
> > > [  100.733658] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.733690] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.738363] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 80/06/0200/0000/0008 [in] st=0
> > > [  100.738391] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.738427] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.742195] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 80/06/0200/0000/0029 [in] st=0
> > > [  100.742225] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.742262] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.750944] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 80/06/0300/0000/0002 [in] st=0
> > > [  100.750972] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.751006] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.751400] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 80/06/0300/0000/0004 [in] st=0
> > > [  100.751425] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.751455] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.751777] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 00/09/0001/0000/0000 [out] st=0
> > > [  100.751803] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.751821] configfs-gadget gadget: high-speed config #1: c
> > > [  100.757460] aspeed_vhub 1e6a0000.usb-vhub: port1:EP1 Enabling 
> > [in] intr num 1 maxpacket=11
> > > [  100.757502] aspeed_vhub 1e6a0000.usb-vhub: port1:EP2 Enabling 
> > [out] intr num 2 maxpacket=11
> > > [  100.757549] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.820566] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 80/08/0000/0000/0001 [in] st=0
> > > [  100.820594] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.820621] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.821026] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > a1/03/0000/0000/0001 [in] st=0
> > > [  100.821050] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.821076] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.821397] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 21/0b/0000/0000/0000 [out] st=0
> > > [  100.821422] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.821451] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned 0
> > > [  100.821643] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 21/09/0200/0000/0001 [out] st=0
> > > [  100.821666] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.821685] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned -95
> > > [  100.821697] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> > > [  100.821735] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> > > [  100.913006] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > 21/09/0200/0000/0001 [out] st=0
> > > [  100.913034] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > to gadget...
> > > [  100.913056] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > returned -95
> > > [  100.913067] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> > > [  100.946228] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > a3/00/0000/0001/0004 [in] st=0
> > > [  100.946257] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> > > [  100.946274] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port 
> > status=0503 change=0000
> > > [  100.946645] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > a0/00/0000/0000/0004 [in] st=0
> > > [  100.946672] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> > > [  399.741059] aspeed_vhub 1e6a0000.usb-vhub: USB bus suspend
> > > [  399.741081] configfs-gadget gadget: suspend
> > > Best,
> > > Xiuzhi
> > >
> > > ------------------ Original ------------------
> > > From:  "Benjamin Herrenschmidt";<benh@kernel.crashing.org>;
> > > Send time: Thursday, Oct 25, 2018 6:42 AM
> > > To: "Joel Stanley"<joel@jms.id.au>; "xiuzhi"<1450335857@qq.com>;
> > > Cc: "a.filippov"<a.filippov@yadro.com>; "OpenBMC 
> > Maillist"<openbmc@lists.ozlabs.org>;
> > > Subject:  Re: VHUB didn't work on AST2500
> > >
> > > On Wed, 2018-10-24 at 17:02 +1030, Joel Stanley wrote:
> > > > On Wed, 24 Oct 2018 at 17:00, xiuzhi <1450335857@qq.com> wrote:
> > > > >  I am porting obmc-ikvm to my hardware platform. The host screen 
> > can be seen by vncviewer , but the mouse and keyboard didn't work on 
> > AST2500
> > > > > . Only the keys ';' , 'Enter',  '1','2','3','4' work. others 
> > keyinput will deadlock the host screen .
> > > > > The kernel error log:
> > > > > [   99.326586] configfs-gadget gadget: high-speed config #1: c
> > > > > [   99.403704] aspeed_vhub 1e6a0000.usb-vhub: status direction 
> > mismatch
> > > > > [   99.492831] aspeed_vhub 1e6a0000.usb-vhub: status direction 
> > mismatch
> > > > > The kernel version is : video-dev5,
> > > > > commit 2acbc35adcfe15971b701770e1105276a18da9f7
> > > > >
> > > > > Who can give me some suggestions to  debug it?
> > > >
> > > > Ben, do you have any advice?
> > >
> > > I need to know a bit more. What is used as a gadget driver on the BMC ?
> > >
> > > I would probably need to reproduce with some added traces to the driver
> > > to figure out what's going on.
> > >
> > > One first thing to try would be a run with CONFIG_USB_GADGET_DEBUG
> > > along with some indication of what actions happen corresponding to what
> > > part of the log (ie, press key 'a' etc...).
> > >
> > > Cheers,
> > > Ben.
> > >
