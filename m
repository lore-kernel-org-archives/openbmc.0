Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mI4Tn69O"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UILU+WqW"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42jSZc3BwtzDsM2
 for <openbmc@lists.ozlabs.org>; Sun, 28 Oct 2018 17:32:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A40621C47;
 Sun, 28 Oct 2018 02:32:17 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Sun, 28 Oct 2018 02:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:references:subject; s=fm1; bh=cxN
 p02wiV6VBBzFBhDcvJOR+SUz+oQ8j55sBVHsq2DM=; b=mI4Tn69OcTpTS+n7H6n
 Oq/Gw+0QRdyT99QklHY/km73Y5M4OX9C1/sUMDNs6l7A7z3NQZj6WnWXlbAcjjSE
 CbPcCs0B1dSWX85oN+tats9v3jWl8MCFIkN57Oc0bpT0t9nU8bshodT/4EFDWHVW
 O4nDw2gi/CjqbznTaKCirmXixwjAK6bO7oeeneNlMnck8onV2d1sqCMF4qUVMwuS
 N+VycciAYB5Ct60GnArejoBNfa/d9RpKzb0MldqdbC4s4yem5wHMAJK8Zy6tFG0U
 FUHcuQ9N4oG7eb+/mFIyffNL8a9AWUAiKXGB42QJ846SkIeIGmSNJzuurwQFpB6M
 r4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=cxNp02wiV6VBBzFBhDcvJOR+SUz+oQ8j55sBVHsq2
 DM=; b=UILU+WqWz0t5bk8X/JRI9RhSkERfHnZPxcuV1+HUVeDPLETC8xstp0jwj
 iDwElfjsOCN5d0o17dzpCVOpDGJZxNnhrn7bMQ0YNKzKEB448m0p0JGUkKZGi5q7
 qoe/Ciat/1Ou5fkXOxmGyAbFVc1up0xSu/LlYA6bXR+XgJkYE5stdX3DYIjj9iMN
 vSPnEOICNoLorSxYUpo3AbOB42VQjDTDA8XCoV8HII+TSlMVPvQc2nJNg+Vyq8z5
 MwNfeLQcPpe0DR35xAl5//1U15j9t0248oKn2EGQmmpg72a/Bm4zjmd7XAF8kegF
 iB65MkP4O2bBTYq/Syw6ThD1NiXhg==
X-ME-Sender: <xms:71fVW89RXPg-8Gl6iDrGNRKZd69QZkUyFOJfup2jOP8E42BKn3vlHg>
X-ME-Proxy: <xmx:71fVWzywVw6_bU5dUJy-zOEPPTGwmOuWLvCM-Mjd8tAsAIsQF4SIsw>
 <xmx:71fVW_nckwDase5x4rztAIjZBsmcNB5Yah-phX13kFWLdIKpSuZHAw>
 <xmx:71fVW8d-nZZCwkIcJgUDqn5clblrLG7tzZm63gWehDIRwBsq3LQiBQ>
 <xmx:71fVW1q8O8R_1_xpRIZZjUrzUYQgywSa1y2asFhz97ogAV6rIjY3nw>
 <xmx:71fVW64WHhxbMLCL_e-Kt5jioEU8R6WSK5RMX3d9wSsHAM1usBEKNw>
 <xmx:8VfVW9yPIYQ3X8B7L1XcGseotu5cbjC_NbiPckSTv454SFQ6ciaeew>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 5325D941BA; Sun, 28 Oct 2018 02:32:15 -0400 (EDT)
Message-Id: <1540708335.2052072.1557084312.78CC03D4@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: xiuzhi <1450335857@qq.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: openbmc <openbmc@lists.ozlabs.org>,
 "Alexander A. Filippov" <a.filippov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-63008d4f
Date: Sun, 28 Oct 2018 17:02:15 +1030
In-Reply-To: <tencent_5A704DBF64FA7D927949B15D@qq.com>
References: <tencent_2D44968D30021E8C093CB1BE@qq.com>
 <f159becabdbbd1daf3517accdfe2d51f4bb04f82.camel@kernel.crashing.org>
 <tencent_5A704DBF64FA7D927949B15D@qq.com>
Subject: Re:  Re: VHUB didn't work on AST2500
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
X-List-Received-Date: Sun, 28 Oct 2018 06:32:29 -0000

On Sun, 28 Oct 2018, at 12:19, xiuzhi wrote:
> Hi Ben, Eddie,
>   I update the kernel,libvncserver,obmc-ikvm source to the latest git 
> commit numbers. 
> Now I can input  number key 0-9, but still can't input any character key 
> a-z  .
> 1)kernel:   
> KSRC ?= "git://github.com/eddiejames/linux;protocol=git;branch=$
> {KBRANCH}"
> KBRANCH ?= "video-dev"
> LINUX_VERSION ?= "4.18.12"
> SRCREV = "b953727d56c4de63eb0fad1f079f41004e61d713"
> and updated the defconfig,create_usbhid.sh  as Eddie mentioned .
> 2)libvncserver
> SRC_URI = "git://github.com/LibVNC/libvncserver"
> 
> SRCREV = "ca2a5ac02fbbadd0a21fabba779c1ea69173d10b" 
> 3)obmc-ikvm
> SRC_URI = "git://github.com/eddiejames/obmc-ikvm"
> SRCREV = "d548ee6c8f59c23552d61fb28b2ca2f20e6f3fe6"
> 4) I input key on host BIOS CLI:
> "1234567890" 'Enter' : good ,can see them on host screen
> 'a' 'Enter':error ,see nothing
> 'b' 'Enter':error,see nothing
> 'c' 'Enter':error,see nothing
> "123456789"'Enter':good
> The dmesg is :
> [   57.002351] udc 1e6a0000.usb-vhub:p1: registering UDC driver 
> [obmc_hid]
> [   57.002452] configfs-gadget gadget: adding 'hid'/e5acc706 to config 
> 'c'/7ef6bc13
> [   57.002488] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> [   57.002509] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen EP 0 
> for addr 1
> [   57.013399] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#0 for 
> port EP1
> [   57.013435] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> [   57.013453] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen EP 1 
> for addr 2
> [   57.018946] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#1 for 
> port EP2
> [   57.019463] aspeed_vhub 1e6a0000.usb-vhub: port1 start
> [   57.019492] aspeed_vhub 1e6a0000.usb-vhub: port1 pullup(1)
> [   57.019512] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 0000 -
> > 0001 (C=1)
> [   66.751716] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request() 
> failed for pin 67
> [   66.759322] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67 
> (1e780000.gpio:347) status -1
> [   68.577538] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request() 
> failed for pin 67
> [   68.585288] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67 
> (1e780000.gpio:347) status -1

Out of curiousity, what is causing the pinctrl failure? Do you have a mux clash?

> [  100.115387] aspeed_vhub 1e6a0000.usb-vhub: USB bus resume
> [  100.115411] configfs-gadget gadget: resume
> [  100.115427] aspeed_vhub 1e6a0000.usb-vhub: USB bus reset
> [  100.258057] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 00/05/0002/0000/0000 [out] st=0
> [  100.258092] aspeed_vhub 1e6a0000.usb-vhub: USB status=0b100000 
> speed=high
> [  100.258107] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SET_ADDRESS: Got 
> address 2
> [  100.279075] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 80/06/0100/0000/0008 [in] st=0
> [  100.279103] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> GET_DESCRIPTOR(type:1)
> [  100.283632] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 80/06/0100/0000/0012 [in] st=0
> [  100.283664] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> GET_DESCRIPTOR(type:1)
> [  100.288371] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 80/06/0200/0000/0008 [in] st=0
> [  100.288405] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> GET_DESCRIPTOR(type:2)
> [  100.292205] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 80/06/0200/0000/0019 [in] st=0
> [  100.292235] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> GET_DESCRIPTOR(type:2)
> [  100.300948] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 80/06/0300/0000/0002 [in] st=0
> [  100.301268] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 80/06/0300/0000/0004 [in] st=0
> [  100.301640] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 00/09/0001/0000/0000 [out] st=0
> [  100.335144] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> a0/06/2900/0000/0002 [in] st=0
> [  100.335178] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> GetHubDescriptor(0)
> [  100.335196] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> GET_DESCRIPTOR(type:41)
> [  100.335527] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> a0/06/2900/0000/0009 [in] st=0
> [  100.335554] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> GetHubDescriptor(0)
> [  100.335569] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> GET_DESCRIPTOR(type:41)
> [  100.339672] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/03/0008/0001/0000 [out] st=0
> [  100.339703] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> SetPortFeature(1,8)
> [  100.339890] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/03/0008/0002/0000 [out] st=0
> [  100.339912] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> SetPortFeature(2,8)
> [  100.340139] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/03/0008/0003/0000 [out] st=0
> [  100.340160] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> SetPortFeature(3,8)
> [  100.340386] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/03/0008/0004/0000 [out] st=0
> [  100.340404] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> SetPortFeature(4,8)
> [  100.340637] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/03/0008/0005/0000 [out] st=0
> [  100.340656] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> SetPortFeature(5,8)
> [  100.360852] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> a0/00/0000/0000/0004 [in] st=0
> [  100.360884] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> [  100.500028] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> a3/00/0000/0001/0004 [in] st=0
> [  100.500062] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> [  100.500082] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0101 
> change=0001
> [  100.500404] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/01/0010/0001/0000 [out] st=0
> [  100.500435] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> ClearPortFeature(1,16)
> [  100.615543] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/03/0004/0001/0000 [out] st=0
> [  100.615579] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> SetPortFeature(1,4)
> [  100.615594] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 Port reset !
> [  100.615612] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 0001 -
> > 0011 (C=0)
> [  100.615626] aspeed_vhub 1e6a0000.usb-vhub: port1 Reset at unknown 
> speed of disabled device, enabling...
> [  100.615643] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 0011 -
> > 0403 (C=1)
> [  100.635854] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> a3/00/0000/0001/0004 [in] st=0
> [  100.635885] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> [  100.635903] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503 
> change=0012
> [  100.636271] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/01/0011/0001/0000 [out] st=0
> [  100.636299] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> ClearPortFeature(1,17)
> [  100.636515] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> 23/01/0014/0001/0000 [out] st=0
> [  100.636540] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> ClearPortFeature(1,20)
> [  100.649529] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 00/05/0003/0000/0000 [out] st=0
> [  100.649564] aspeed_vhub 1e6a0000.usb-vhub: port1 fist packet, 
> captured speed 3
> [  100.649580] aspeed_vhub 1e6a0000.usb-vhub: port1 SET_ADDRESS: Got 
> address 3
> [  100.665314] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> a3/00/0000/0001/0004 [in] st=0
> [  100.665345] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> [  100.665363] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503 
> change=0000
> [  100.680170] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 80/06/0100/0000/0008 [in] st=0
> [  100.680200] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.680234] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.684627] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 80/06/0100/0000/0012 [in] st=0
> [  100.684657] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.684690] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.689471] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 80/06/0200/0000/0008 [in] st=0
> [  100.689500] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.689538] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.693198] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 80/06/0200/0000/0029 [in] st=0
> [  100.693231] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.693267] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.701949] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 80/06/0300/0000/0002 [in] st=0
> [  100.701983] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.702020] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.702403] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 80/06/0300/0000/0004 [in] st=0
> [  100.702432] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.702466] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.702774] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 00/09/0001/0000/0000 [out] st=0
> [  100.702799] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.702818] configfs-gadget gadget: high-speed config #1: c
> [  100.708470] aspeed_vhub 1e6a0000.usb-vhub: port1:EP1 Enabling [in] 
> intr num 1 maxpacket=11
> [  100.708512] aspeed_vhub 1e6a0000.usb-vhub: port1:EP2 Enabling [out] 
> intr num 2 maxpacket=11
> [  100.708565] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.777585] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 80/08/0000/0000/0001 [in] st=0
> [  100.777619] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.777649] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.778029] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> a1/03/0000/0000/0001 [in] st=0
> [  100.778055] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.778085] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.778403] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 21/0b/0000/0000/0000 [out] st=0
> [  100.778428] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.778457] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> 0
> [  100.778649] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 21/09/0200/0000/0001 [out] st=0
> [  100.778672] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.778692] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> -95
> [  100.778704] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> [  100.778746] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> [  100.859563] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> 21/09/0200/0000/0001 [out] st=0
> [  100.859592] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to 
> gadget...
> [  100.859618] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned 
> -95
> [  100.859633] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> [  100.892835] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> a3/00/0000/0001/0004 [in] st=0
> [  100.892866] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> [  100.892882] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503 
> change=0000
> [  100.893278] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> a0/00/0000/0000/0004 [in] st=0
> [  100.893305] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> 
> Best,
> Xiuzhi
> 
> ------------------ Original ------------------
> From:  "Benjamin Herrenschmidt";<benh@kernel.crashing.org>;
> Send time: Saturday, Oct 27, 2018 7:55 AM
> To: "xiuzhi"<1450335857@qq.com>; "Eddie 
> James"<eajames@linux.vnet.ibm.com>; "Joel Stanley"<joel@jms.id.au>; 
> Cc: "openbmc"<openbmc@lists.ozlabs.org>; "Alexander A. 
> Filippov"<a.filippov@yadro.com>; 
> Subject:  Re: Re: VHUB didn't work on AST2500
> 
> 
> 
> On Fri, 2018-10-26 at 14:34 +0800, xiuzhi wrote:
> > Hi Eddie,
> >    Thanks for your reply.  
> > It seemd that the error was caused by the  version dismatch of kernel ,libvncserver ,obmc-ikvm and  vnc client. 
> > Would you like to give me your  git commits numbers of them?
> 
> It's still a very strange error.
> 
> Once everything is up to date, let me know if it occurs again, there's
> something not right going on in the vhub driver causing that state
> mismatch error, it shouldn't happen. But I haven't managed to reproduce
> it here.
> 
> Cheers,
> Ben.
> 
> > Best,
> > xiuzhi  
> > On 10/24/2018 09:52 PM, xiuzhi wrote:
> > > Hi Ben,
> > >   I use vncviewer , xtightvncviewer 1.3.9-6.4ubuntu1.
> > > And I also tested the ikvm by webui 
> > > vnc(_https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/_) 
> > > ,the same errors occured.
> > > The same source code obmc-ikvm and this  kernel branch video-dev5  
> > > works on my other  AST2400 hardware machine.
> > > I remembered  only one  kernel version seemed to work on ast2500 ,I 
> > > tested it six weeks ago .
> > >  the kernel version is:
> > >
> > > KBRANCH ?= "video-dev"
> > > LINUX_VERSION ?= "4.17.11"
> > > SRCREV="09a65900b2fc7aab9caf9d0dfabc7ba80525b1dd"
> > > the git repo is from  git://github.com/eddiejames/linux/,
> > >
> > > https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11500/5/meta-openbmc-bsp/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb
> > > I want to test this kernel version ,but now this git repo is not 
> > > available ,
> > >  I asked Eddiejames week ago, and get no response until now .
> > >  It is so bad that I did not  backup this kernel on my local machice.
> > 
> > I never made any kernel changes related to USB in my github trees, as 
> > far as I know, so shouldn't be any difference. That original gerrit 
> > commit was purely for our testing purposes for our system... not really 
> > something I can support actively.
> > 
> > I have a number of commits pending review that you could try and pull in 
> > if you really need this now:
> > https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/13536/
> > https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-aspeed/+/13541/
> > https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/12126/
> > https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/13888/
> > 
> > Use these in combination with the two commits at the top of my video-dev 
> > linux tree for your kernel.
> > 
> > Thanks,
> > Eddie
> > 
> > >
> > > Best.
> > > Xiuzhi
> > > On Thu, 2018-10-25 at 09:39 +0800, xiuzhi wrote:
> > > > Hi Ben,
> > > >   I open the CONFIG_USB_GADGET_DEBUG .
> > > > and input the following keys by order:
> > > > ';''Enter' :work good,can see ';' on host screen
> > > > 'a''Enter' :error,see anything on screen
> > > > 'b''Enter' :error,see anything on screen
> > > > '1''Enter' :good
> > > > '2''Enter' :good
> > > > '3''Enter' :good
> > > > '4''Enter' :good
> > > > '5''Enter'  :error deadlock
> > > > The log is:
> > >
> > > Can you tell me more about the userspace components you use to send
> > > those keys ? I'd like to try to reproduce here.
> > >
> > > > [   78.820671] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request() 
> > > failed for pin 67
> > > > [   78.828274] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67 
> > > (1e780000.gpio:347) status -1
> > > > [   80.698564] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request() 
> > > failed for pin 67
> > > > [   80.706166] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67 
> > > (1e780000.gpio:347) status -
> > > > [   94.447816] udc 1e6a0000.usb-vhub:p1: registering UDC driver 
> > > [obmc_hid]
> > > > [   94.447909] configfs-gadget gadget: adding 'hid'/15e5a204 to 
> > > config 'c'/70dd0747
> > > > [   94.447940] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> > > > [   94.447958] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen 
> > > EP 0 for addr 1
> > > > [   94.448474] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#0 
> > > for port EP1
> > > > [   94.448505] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> > > > [   94.448522] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen 
> > > EP 1 for addr 2
> > > > [   94.448780] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#1 
> > > for port EP2
> > > > [   94.449270] aspeed_vhub 1e6a0000.usb-vhub: port1 start
> > > > [   94.449297] aspeed_vhub 1e6a0000.usb-vhub: port1 pullup(1)
> > > > [   94.449317] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 
> > > 0000 -> 0001 (C=1)
> > > > [  100.158377] aspeed_vhub 1e6a0000.usb-vhub: USB bus resume
> > > > [  100.158400] configfs-gadget gadget: resume
> > > > [  100.158415] aspeed_vhub 1e6a0000.usb-vhub: USB bus reset
> > > > [  100.301048] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 00/05/0002/0000/0000 [out] st=0
> > > > [  100.301081] aspeed_vhub 1e6a0000.usb-vhub: USB status=0b100000 
> > > speed=high
> > > > [  100.301096] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SET_ADDRESS: 
> > > Got address 2
> > > > [  100.322061] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 80/06/0100/0000/0008 [in] st=0
> > > > [  100.322090] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > GET_DESCRIPTOR(type:1)
> > > > [  100.326625] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 80/06/0100/0000/0012 [in] st=0
> > > > [  100.326656] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > GET_DESCRIPTOR(type:1)
> > > > [  100.331359] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 80/06/0200/0000/0008 [in] st=0
> > > > [  100.331392] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > GET_DESCRIPTOR(type:2)
> > > > [  100.335194] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 80/06/0200/0000/0019 [in] st=0
> > > > [  100.335221] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > GET_DESCRIPTOR(type:2)
> > > > [  100.343939] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 80/06/0300/0000/0002 [in] st=0
> > > > [  100.344272] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 80/06/0300/0000/0004 [in] st=0
> > > > [  100.344647] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 00/09/0001/0000/0000 [out] st=0
> > > > [  100.378145] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > a0/06/2900/0000/0002 [in] st=0
> > > > [  100.378178] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > GetHubDescriptor(0)
> > > > [  100.378195] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > GET_DESCRIPTOR(type:41)
> > > > [  100.378522] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > a0/06/2900/0000/0009 [in] st=0
> > > > [  100.378546] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > GetHubDescriptor(0)
> > > > [  100.378560] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > GET_DESCRIPTOR(type:41)
> > > > [  100.382665] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/03/0008/0001/0000 [out] st=0
> > > > [  100.382697] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > SetPortFeature(1,8)
> > > > [  100.382896] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/03/0008/0002/0000 [out] st=0
> > > > [  100.382922] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > SetPortFeature(2,8)
> > > > [  100.383148] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/03/0008/0003/0000 [out] st=0
> > > > [  100.383173] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > SetPortFeature(3,8)
> > > > [  100.383396] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/03/0008/0004/0000 [out] st=0
> > > > [  100.383422] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > SetPortFeature(4,8)
> > > > [  100.383643] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/03/0008/0005/0000 [out] st=0
> > > > [  100.383668] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > SetPortFeature(5,8)
> > > > [  100.403844] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > a0/00/0000/0000/0004 [in] st=0
> > > > [  100.403871] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> > > > [  100.549225] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > a3/00/0000/0001/0004 [in] st=0
> > > > [  100.549257] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> > > > [  100.549275] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port 
> > > status=0101 change=0001
> > > > [  100.549651] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/01/0010/0001/0000 [out] st=0
> > > > [  100.549681] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > ClearPortFeature(1,16)
> > > > [  100.664592] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/03/0004/0001/0000 [out] st=0
> > > > [  100.664625] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > SetPortFeature(1,4)
> > > > [  100.664639] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 Port reset !
> > > > [  100.664658] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 
> > > 0001 -> 0011 (C=0)
> > > > [  100.664672] aspeed_vhub 1e6a0000.usb-vhub: port1 Reset at unknown 
> > > speed of disabled device, enabling.
> > > > [  100.664689] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 
> > > 0011 -> 0403 (C=1)
> > > > [  100.684840] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > a3/00/0000/0001/0004 [in] st=0
> > > > [  100.684867] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> > > > [  100.684885] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port 
> > > status=0503 change=0012
> > > > [  100.685276] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/01/0011/0001/0000 [out] st=0
> > > > [  100.685306] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > ClearPortFeature(1,17)
> > > > [  100.685518] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > 23/01/0014/0001/0000 [out] st=0
> > > > [  100.685544] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 
> > > ClearPortFeature(1,20)
> > > > [  100.698539] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 00/05/0003/0000/0000 [out] st=0
> > > > [  100.698568] aspeed_vhub 1e6a0000.usb-vhub: port1 fist packet, 
> > > captured speed 3
> > > > [  100.698585] aspeed_vhub 1e6a0000.usb-vhub: port1 SET_ADDRESS: Got 
> > > address 3
> > > > [  100.714314] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > a3/00/0000/0001/0004 [in] st=0
> > > > [  100.714339] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> > > > [  100.714354] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port 
> > > status=0503 change=0000
> > > > [  100.729165] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 80/06/0100/0000/0008 [in] st=0
> > > > [  100.729195] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.729227] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.733627] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 80/06/0100/0000/0012 [in] st=0
> > > > [  100.733658] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.733690] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.738363] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 80/06/0200/0000/0008 [in] st=0
> > > > [  100.738391] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.738427] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.742195] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 80/06/0200/0000/0029 [in] st=0
> > > > [  100.742225] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.742262] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.750944] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 80/06/0300/0000/0002 [in] st=0
> > > > [  100.750972] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.751006] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.751400] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 80/06/0300/0000/0004 [in] st=0
> > > > [  100.751425] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.751455] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.751777] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 00/09/0001/0000/0000 [out] st=0
> > > > [  100.751803] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.751821] configfs-gadget gadget: high-speed config #1: c
> > > > [  100.757460] aspeed_vhub 1e6a0000.usb-vhub: port1:EP1 Enabling 
> > > [in] intr num 1 maxpacket=11
> > > > [  100.757502] aspeed_vhub 1e6a0000.usb-vhub: port1:EP2 Enabling 
> > > [out] intr num 2 maxpacket=11
> > > > [  100.757549] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.820566] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 80/08/0000/0000/0001 [in] st=0
> > > > [  100.820594] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.820621] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.821026] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > a1/03/0000/0000/0001 [in] st=0
> > > > [  100.821050] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.821076] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.821397] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 21/0b/0000/0000/0000 [out] st=0
> > > > [  100.821422] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.821451] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned 0
> > > > [  100.821643] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 21/09/0200/0000/0001 [out] st=0
> > > > [  100.821666] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.821685] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned -95
> > > > [  100.821697] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> > > > [  100.821735] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> > > > [  100.913006] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 
> > > 21/09/0200/0000/0001 [out] st=0
> > > > [  100.913034] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding 
> > > to gadget...
> > > > [  100.913056] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver 
> > > returned -95
> > > > [  100.913067] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> > > > [  100.946228] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > a3/00/0000/0001/0004 [in] st=0
> > > > [  100.946257] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> > > > [  100.946274] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port 
> > > status=0503 change=0000
> > > > [  100.946645] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 
> > > a0/00/0000/0000/0004 [in] st=0
> > > > [  100.946672] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> > > > [  399.741059] aspeed_vhub 1e6a0000.usb-vhub: USB bus suspend
> > > > [  399.741081] configfs-gadget gadget: suspend
> > > > Best,
> > > > Xiuzhi
> > > >
> > > > ------------------ Original ------------------
> > > > From:  "Benjamin Herrenschmidt";<benh@kernel.crashing.org>;
> > > > Send time: Thursday, Oct 25, 2018 6:42 AM
> > > > To: "Joel Stanley"<joel@jms.id.au>; "xiuzhi"<1450335857@qq.com>;
> > > > Cc: "a.filippov"<a.filippov@yadro.com>; "OpenBMC 
> > > Maillist"<openbmc@lists.ozlabs.org>;
> > > > Subject:  Re: VHUB didn't work on AST2500
> > > >
> > > > On Wed, 2018-10-24 at 17:02 +1030, Joel Stanley wrote:
> > > > > On Wed, 24 Oct 2018 at 17:00, xiuzhi <1450335857@qq.com> wrote:
> > > > > >  I am porting obmc-ikvm to my hardware platform. The host screen 
> > > can be seen by vncviewer , but the mouse and keyboard didn't work on 
> > > AST2500
> > > > > > . Only the keys ';' , 'Enter',  '1','2','3','4' work. others 
> > > keyinput will deadlock the host screen .
> > > > > > The kernel error log:
> > > > > > [   99.326586] configfs-gadget gadget: high-speed config #1: c
> > > > > > [   99.403704] aspeed_vhub 1e6a0000.usb-vhub: status direction 
> > > mismatch
> > > > > > [   99.492831] aspeed_vhub 1e6a0000.usb-vhub: status direction 
> > > mismatch
> > > > > > The kernel version is : video-dev5,
> > > > > > commit 2acbc35adcfe15971b701770e1105276a18da9f7
> > > > > >
> > > > > > Who can give me some suggestions to  debug it?
> > > > >
> > > > > Ben, do you have any advice?
> > > >
> > > > I need to know a bit more. What is used as a gadget driver on the BMC ?
> > > >
> > > > I would probably need to reproduce with some added traces to the driver
> > > > to figure out what's going on.
> > > >
> > > > One first thing to try would be a run with CONFIG_USB_GADGET_DEBUG
> > > > along with some indication of what actions happen corresponding to what
> > > > part of the log (ie, press key 'a' etc...).
> > > >
> > > > Cheers,
> > > > Ben.
> > > >
