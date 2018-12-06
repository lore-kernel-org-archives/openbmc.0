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
 by lists.ozlabs.org (Postfix) with ESMTPS id 439QfX6g4mzDr6x
 for <openbmc@lists.ozlabs.org>; Thu,  6 Dec 2018 17:28:52 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id wB66SQWE018346;
 Thu, 6 Dec 2018 00:28:28 -0600
Message-ID: <2080cf91c924a85be773adf820a31590796e0c2b.camel@kernel.crashing.org>
Subject: Re:  VHUB didn't work on AST2500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: xiuzhi <1450335857@qq.com>, eajames <eajames@linux.ibm.com>,
 "Andrew.Jeffery" <andrew@aj.id.au>,
 Eddie James <eajames@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: openbmc <openbmc@lists.ozlabs.org>, "Alexander A. Filippov"
 <a.filippov@yadro.com>
Date: Thu, 06 Dec 2018 17:28:25 +1100
In-Reply-To: <tencent_1F1256011C5AE8EF18989892@qq.com>
References: <tencent_13FAC6CC09F9B66920987BA0@qq.com>
 <5f345c3a2006fd3b643bf59f0d4b5bb3c47f50cd.camel@kernel.crashing.org>
 <cb80c94b-f73e-4993-6246-1bb36d26c956@linux.ibm.com>
 <tencent_1F1256011C5AE8EF18989892@qq.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
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
X-List-Received-Date: Thu, 06 Dec 2018 06:28:54 -0000

On Thu, 2018-12-06 at 09:37 +0800, xiuzhi wrote:
> Hi Eddie,
>   Yes, the reason is that the vhub keyboard only support HID report
>  protocol   ,while UEFI BIOS (and most common BIOS) only support HID
> boot mode. It would be  better if vhub were modified to support both
> HID report  protocol and boot protocol

This has nothing to do with vhub. It's either in the kernel generic USB
gadget f_hid.c code or in the userspace code that feeds it.

>     The UEFI BIOS try to request vhub switch to boot mode , but
> failed. The following is the UEFI code :
> Request.RequestType = USB_HID_CLASS_SET_REQ_TYPE;
>   Request.Request = EFI_USB_SET_PROTOCOL_REQUEST;
>   Request.Value   = Protocol;
>   Request.Index   = Interface;
>   Request.Length  = 0;
> 
>   Result = UsbIo->UsbControlTransfer (
>                     UsbIo,
>                     &Request,
>                     EfiUsbNoData,
>                     PcdGet32 (PcdUsbTransferTimeoutValue),
>                     NULL,
>                     0,
>                     &Status
>                     ); 
> 
> Best,
> Xiuzhi
> 
> ------------------ Original ------------------
> From:  "eajames";<eajames@linux.ibm.com>;
> Send time: Thursday, Dec 6, 2018 4:15 AM
> To: "Benjamin Herrenschmidt"<benh@kernel.crashing.org>; "xiuzhi"<1450335857@qq.com>; "Andrew.Jeffery"<andrew@aj.id.au>; "Eddie James"<eajames@linux.vnet.ibm.com>; "Joel Stanley"<joel@jms.id.au>;
> Cc: "openbmc"<openbmc@lists.ozlabs.org>; "Alexander A. Filippov"<a.filippov@yadro.com>;
> Subject:  Re: VHUB didn't work on AST2500
> 
> 
> 
> On 12/05/2018 02:37 AM, Benjamin Herrenschmidt wrote:
> > On Wed, 2018-12-05 at 11:39 +0800, xiuzhi wrote:
> >> Hi Ben, Andrew,
> >>      I found the reason is that the key values are different between usb-vhub keyboard and physical keyboard. The vhub key value has one more byte than physical. and it seemed that vhub mouse uses keyboard channel, the BIOS can receive values from vhub mouse even if BIOS closed the mouse driver.
> >> 1,   When the vhub mouse moves from ikvm, the vhub mouse sends out 6 bytes  data to keyboard channel:
> > vhub itself just passes the data that's coming from the HID gadget
> > driver, I don't know much about how it construct packets or is
> > configured, you may want to look into it.
> >
> > Ben.
> >
> >> 02 00 50 14 CE 22
> >> 02 00 B0 0E E8 20
> >> 02 00 48 08 96 1E
> >> ..........
> >> 2,  The first byte of data sent by the vhub keyboard value  is incorrect. The first byte is 01, which means that the control key is pressed from the physical keyboard view.
> >> 1) using vhub keyboard
> >> Presses the key 'a' , BIOS  receives data:
> >>
> >> 01 00 00 04 00 00 00 00
> >>
> >> Release key 'a' ,BIOS  receives data:
> >>
> >> 01 00 00 00 00 00 00 00
> >>
> >>   Press 'Control' +'a' ,BIOS  receives data:
> >>
> >> 01 01 00 04 00 00 00 00
> >> Press the key'1' ,BIOS  receives data:
> >>
> >> 01 00 1E 00 00 00 00
> >>
> >> Release key'1'usb, BIOS  receives data:
> >>
> >> 01 00 00 00 00 00 00
> >> 2) using physical keyboard
> >> Press the key 'a' ,BIOS  receives data:
> >> 00 00 04 00 00 00 00 00
> >>   
> >> Release key 'a' usb ,BIOS  receives data::
> >>
> >> 00 00 00 00 00 00 00 00
> >>
> >> Press 'Control' + 'a' ,BIOS  receives data:
> >>
> >> 01 00 04 00 00 00 00 00
> >> Press the key '1' ,BIOS  receives data:
> >>
> >> 00 00 1E 00 00 00 00 00
> >>
> >> Release key '1' ,BIOS  receives data:
> >>
> >> 00 00 00 00 00 00 00 00
> >> Why does the vhub keyboard  has the extra  first byte '01'?
> >> Why vhub mouse use  keyboard channel to transfer data?
> 
> It's a combined pointer and keyboard HID device. This isn't ideal, but I 
> had more problems trying to use 2 separate HID devices actually.
> 
> 01 is the device code for the keyboard, 02 is the device code for the 
> pointer. HID standard allows that byte as the identifier for the report 
> I think. See the create_usbhid.sh script packaged with the ikvm 
> application. If you just want a keyboard, you could modify the 
> descriptor sent to the gadget to just send keyboard.
> 
> Thanks,
> Eddie
> 
> >>
> >> Best,
> >> xiuzhi
> >> ------------------ Original ------------------
> >> From:  "Benjamin Herrenschmidte";<benh@kernel.crashing.org>;
> >> Send time: Monday, Nov 5, 2018 7:09 AM
> >> To: "xiuzhi"<1450335857@qq.com>; "Andrew.Jeffery"<andrew@aj.id.au>; "EddieJames"<eajames@linux.vnet.ibm.com>; "Joel Stanley"<joel@jms.id.au>;
> >> Cc: "openbmc"<openbmc@lists.ozlabs.org>; "Alexander A. Filippov"<a.filippov@yadro.com>;
> >> Subject:  Re: Re: VHUB didn't work on AST2500
> >>
> >> On Sun, 2018-11-04 at 10:54 +0800, xiuzhi wrote:
> >>> Hi Ben,
> >>>     Did you reproduce this issue?
> >>> I found this issue is related to the host UEFI BIOS usb driver last week.
> >>> My host BIOS  is   cloned from udk2017 (www.uefi.org) .
> >>> The ikvm mouse and keyboard work when the BIOS runs on legacy mode
> >>> and will fail on UEFI mode.
> >>>   I also compared the AMI BMC and OpenBMC.
> >>> The AMI BMC ikvm (version is r11) works on  this problematic BIOS ,while OpenBMC  will fail on the same one  .
> >>> The OpenBMC ikvm works on legacy mode ,and fails on UEFI mode.
> >>>     Do you have any suggestions ?
> >> That's good to know any explains why I cannot reproduce as I don't have
> >> an UEFI system to test with.
> >>
> >> I suspect something the UEFI BIOS does that upsets the Linux USB gadget
> >> stack.
> >>
> >> I could debug this if I had access to a system, either physically here
> >> or remotely, where I can remotely install/netboot BMC kernels (so I
> >> would probably need a serial connection to the BMC and a PDU), any
> >> suggestion on how to do that ?
> >>
> >> Otherwise, would there be a way to reproduce that with the x86 running
> >> in qemu ? (plugging the AST2500 eval board USB into the host and
> >> passing it through for example) ?
> >>
> >> Cheers,
> >> Ben.
> >>
> >>> Best,
> >>> Xiuzhi
> >>> Hi Eddie,
> >>>     The new obmc-ikvm has an new issue which got from https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/13888/
> >>>     The number key 0-9 can input at the first BMC boot  start-ipkvm.service.
> >>> It can't input any key when I restart the host ,and restart the start-ipkvm.service because of host screen resolution changed  :
> >>> systemctl restart start-ipkvm.service
> >>> dmesg log:
> >>> [  144.990545] aspeed-video 1e700000.video: resolution changed; resetting
> >>> [  145.135654] aspeed_vhub 1e6a0000.usb-vhub: USB bus suspend
> >>> [  145.135672] configfs-gadget gadget: suspend
> >>> [  146.020671] aspeed-video 1e700000.video: timed out on 1st mode detect
> >>> [  146.027154] aspeed-video 1e700000.video: resolution changed; couldn't get new resolution
> >>> [  267.098598] aspeed_vhub 1e6a0000.usb-vhub: USB bus resume
> >>> [  267.098623] configfs-gadget gadget: resume
> >>> [  267.098642] aspeed_vhub 1e6a0000.usb-vhub: USB bus reset
> >>> [  267.098650] configfs-gadget gadget: suspend
> >>> [  267.241258] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 00/05/0002/0000/0000 [out] st=0
> >>> [  267.241292] aspeed_vhub 1e6a0000.usb-vhub: USB status=0b100000 speed=high
> >>> [  267.241308] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SET_ADDRESS: Got address 2
> >>> [  267.262265] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 80/06/0100/0000/0008 [in] st=0
> >>> [  267.262293] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GET_DESCRIPTOR(type:1)
> >>> [  267.266784] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 80/06/0100/0000/0012 [in] st=0
> >>> [  267.266805] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GET_DESCRIPTOR(type:1)
> >>> [  267.271552] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 80/06/0200/0000/0008 [in] st=0
> >>> [  267.271585] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GET_DESCRIPTOR(type:2)
> >>> [  267.275390] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 80/06/0200/0000/0019 [in] st=0
> >>> [  267.275422] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GET_DESCRIPTOR(type:2)
> >>> [  267.284132] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 80/06/0300/0000/0002 [in] st=0
> >>> [  267.284475] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 80/06/0300/0000/0004 [in] st=0
> >>> [  267.284850] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 00/09/0001/0000/0000 [out] st=0
> >>> [  267.318337] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet a0/06/2900/0000/0002 [in] st=0
> >>> [  267.318370] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubDescriptor(0)
> >>> [  267.318390] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GET_DESCRIPTOR(type:41)
> >>> [  267.318723] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet a0/06/2900/0000/0009 [in] st=0
> >>> [  267.318749] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubDescriptor(0)
> >>> [  267.318765] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GET_DESCRIPTOR(type:41)
> >>> [  267.322862] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/03/0008/0001/0000 [out] st=0
> >>> [  267.322892] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SetPortFeature(1,8)
> >>> [  267.323093] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/03/0008/0002/0000 [out] st=0
> >>> [  267.323121] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SetPortFeature(2,8)
> >>> [  267.323343] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/03/0008/0003/0000 [out] st=0
> >>> [  267.323368] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SetPortFeature(3,8)
> >>> [  267.323595] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/03/0008/0004/0000 [out] st=0
> >>> [  267.323622] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SetPortFeature(4,8)
> >>> [  267.323843] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/03/0008/0005/0000 [out] st=0
> >>> [  267.323870] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SetPortFeature(5,8)
> >>> [  267.344036] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet a0/00/0000/0000/0004 [in] st=0
> >>> [  267.344069] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> >>> [  267.481060] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet a3/00/0000/0001/0004 [in] st=0
> >>> [  267.481091] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>> [  267.481108] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0101 change=0001
> >>> [  267.481446] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/01/0010/0001/0000 [out] st=0
> >>> [  267.481468] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 ClearPortFeature(1,16)
> >>> [  267.596168] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/03/0004/0001/0000 [out] st=0
> >>> [  267.596202] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SetPortFeature(1,4)
> >>> [  267.596217] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 Port reset !
> >>> [  267.596237] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 0001 -> 0011 (C=0)
> >>> [  267.596251] aspeed_vhub 1e6a0000.usb-vhub: port1 Reset at known speed of bound device, resetting...
> >>> [  267.596259] configfs-gadget gadget: reset config
> >>> [  267.596275] aspeed_vhub 1e6a0000.usb-vhub: port1:EP1 Disabling !
> >>> [  267.596288] aspeed_vhub 1e6a0000.usb-vhub: port1:EP1 Nuking
> >>> [  267.596307] configfs-gadget gadget: End Point Request ERROR: -108
> >>> [  267.602439] aspeed_vhub 1e6a0000.usb-vhub: port1:EP2 Disabling !
> >>> [  267.602458] aspeed_vhub 1e6a0000.usb-vhub: port1:EP2 Nuking
> >>> [  267.602496] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 0011 -> 0403 (C=1)
> >>> [  267.622677] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet a3/00/0000/0001/0004 [in] st=0
> >>> [  267.622710] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>> [  267.622729] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503 change=0012
> >>> [  267.623097] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/01/0011/0001/0000 [out] st=0
> >>> [  267.623127] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 ClearPortFeature(1,17)
> >>> [  267.623344] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet 23/01/0014/0001/0000 [out] st=0
> >>> [  267.623373] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 ClearPortFeature(1,20)
> >>> [  267.636359] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet 00/05/0003/0000/0000 [out] st=2
> >>> [  267.636389] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 wrong state
> >>> [  267.636402] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 Nuking
> >>> [  267.636412] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 Nuking
> >>> [  267.636423] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> >>> [  267.653534] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet a3/00/0000/0001/0004 [in] st=0
> >>> [  267.653566] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>> [  267.653582] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503 change=0000
> >>> [  267.673107] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet a3/00/0000/0001/0004 [in] st=0
> >>> [  267.673140] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>> [  267.673159] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503 change=0000
> >>> [  267.673596] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet a0/00/0000/0000/0004 [in] st=0
> >>> [  267.673622] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> >>>
> >>> Best,
> >>> Xiuzhi
> >>> Hi Andrew,
> >>>      Sorry , the pinctrl error was not caused by uart-render-controller .
> >>> The reason is I definded a wrong gpio pin GPIOI3 (It is pin67) in file recipes-phosphor/sekleton/obmc-libobmc-intfgpio_defs.json.
> >>>
> >>> The error message  dispeared after I removed the pin definition.
> >>> Now, the error of character key inputting  still exists as well .
> >>>
> >>> Best,
> >>> xiuzhi
> >>> Hi Andrew,
> >>>>> [   66.751716] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request()
> >>>>> failed for pin 67
> >>>>> [   66.759322] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67
> >>>>> (1e780000.gpio:347) status -1
> >>>>> [   68.577538] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request()
> >>>>> failed for pin 67
> >>>>> [   68.585288] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67
> >>>>> (1e780000.gpio:347) status -1
> >>>> Out of curiousity, what is causing the pinctrl failure? Do you have a mux clash?
> >>> it was caused by uart-render-controller.service:
> >>> "
> >>> ExecStart=/usr/sbin/obmc-uart-render-controller \         /sys/devices/platform/ahb/ahb:apb/1e6e2000.syscon/1e6e2000.syscon:scratch/vga0 \          /sys/devices/platform/ahb/ahb:apb/1e6e2000.syscon/1e6e2000.syscon:scratch/dac_mux \
> >>>            fbterm.service
> >>> "
> >>> fbterm is related to keyinput.
> >>> AST2500 only support up to 228 gpio pins,but the error message read gpio:347 ,I don't know why ?
> >>>
> >>> Best,
> >>> Xiuzhi
> >>> ------------------ Original ------------------
> >>> From:  "Andrew.Jeffery";<andrew@aj.id.au>;
> >>> Send time: Sunday, Oct 28, 2018 3:02 PM
> >>> To: "xiuzhi"<1450335857@qq.com>; "Benjamin Herrenschmidt"<benh@kernel.crashing.org>; "Eddie James"<eajames@linux.vnet.ibm.com>; "Joel Stanley"<joel@jms.id.au>;
> >>> Cc: "openbmc"<openbmc@lists.ozlabs.org>; "Alexander A. Filippov"<a.filippov@yadro.com>;
> >>> Subject:  Re: Re: VHUB didn't work on AST2500
> >>>
> >>> On Sun, 28 Oct 2018, at 12:19, xiuzhi wrote:
> >>>> Hi Ben, Eddie,
> >>>>    I update the kernel,libvncserver,obmc-ikvm source to the latest git
> >>>> commit numbers.
> >>>> Now I can input  number key 0-9, but still can't input any character key
> >>>> a-z  .
> >>>> 1)kernel:
> >>>> KSRC ?= "git://github.com/eddiejames/linux;protocol=git;branch=$
> >>>> {KBRANCH}"
> >>>> KBRANCH ?= "video-dev"
> >>>> LINUX_VERSION ?= "4.18.12"
> >>>> SRCREV = "b953727d56c4de63eb0fad1f079f41004e61d713"
> >>>> and updated the defconfig,create_usbhid.sh  as Eddie mentioned .
> >>>> 2)libvncserver
> >>>> SRC_URI = "git://github.com/LibVNC/libvncserver"
> >>>>
> >>>> SRCREV = "ca2a5ac02fbbadd0a21fabba779c1ea69173d10b"
> >>>> 3)obmc-ikvm
> >>>> SRC_URI = "git://github.com/eddiejames/obmc-ikvm"
> >>>> SRCREV = "d548ee6c8f59c23552d61fb28b2ca2f20e6f3fe6"
> >>>> 4) I input key on host BIOS CLI:
> >>>> "1234567890" 'Enter' : good ,can see them on host screen
> >>>> 'a' 'Enter':error ,see nothing
> >>>> 'b' 'Enter':error,see nothing
> >>>> 'c' 'Enter':error,see nothing
> >>>> "123456789"'Enter':good
> >>>> The dmesg is :
> >>>> [   57.002351] udc 1e6a0000.usb-vhub:p1: registering UDC driver
> >>>> [obmc_hid]
> >>>> [   57.002452] configfs-gadget gadget: adding 'hid'/e5acc706 to config
> >>>> 'c'/7ef6bc13
> >>>> [   57.002488] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> >>>> [   57.002509] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen EP 0
> >>>> for addr 1
> >>>> [   57.013399] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#0 for
> >>>> port EP1
> >>>> [   57.013435] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> >>>> [   57.013453] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen EP 1
> >>>> for addr 2
> >>>> [   57.018946] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#1 for
> >>>> port EP2
> >>>> [   57.019463] aspeed_vhub 1e6a0000.usb-vhub: port1 start
> >>>> [   57.019492] aspeed_vhub 1e6a0000.usb-vhub: port1 pullup(1)
> >>>> [   57.019512] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 0000 -
> >>>>> 0001 (C=1)
> >>>> [   66.751716] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request()
> >>>> failed for pin 67
> >>>> [   66.759322] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67
> >>>> (1e780000.gpio:347) status -1
> >>>> [   68.577538] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request()
> >>>> failed for pin 67
> >>>> [   68.585288] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67
> >>>> (1e780000.gpio:347) status -1
> >>>> Out of curiousity, what is causing the pinctrl failure? Do you have a mux clash?
> >>>            /sys/devices/platform/ahb/ahb:apb/1e6e2000.syscon/1e6e2000.syscon:scratch/vga0 \
> >>>            /sys/devices/platform/ahb/ahb:apb/1e6e2000.syscon/1e6e2000.syscon:scratch/dac_mux \
> >>>            fbterm.service
> >>>
> >>>> [  100.115387] aspeed_vhub 1e6a0000.usb-vhub: USB bus resume
> >>>> [  100.115411] configfs-gadget gadget: resume
> >>>> [  100.115427] aspeed_vhub 1e6a0000.usb-vhub: USB bus reset
> >>>> [  100.258057] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 00/05/0002/0000/0000 [out] st=0
> >>>> [  100.258092] aspeed_vhub 1e6a0000.usb-vhub: USB status=0b100000
> >>>> speed=high
> >>>> [  100.258107] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SET_ADDRESS: Got
> >>>> address 2
> >>>> [  100.279075] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 80/06/0100/0000/0008 [in] st=0
> >>>> [  100.279103] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> GET_DESCRIPTOR(type:1)
> >>>> [  100.283632] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 80/06/0100/0000/0012 [in] st=0
> >>>> [  100.283664] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> GET_DESCRIPTOR(type:1)
> >>>> [  100.288371] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 80/06/0200/0000/0008 [in] st=0
> >>>> [  100.288405] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> GET_DESCRIPTOR(type:2)
> >>>> [  100.292205] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 80/06/0200/0000/0019 [in] st=0
> >>>> [  100.292235] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> GET_DESCRIPTOR(type:2)
> >>>> [  100.300948] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 80/06/0300/0000/0002 [in] st=0
> >>>> [  100.301268] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 80/06/0300/0000/0004 [in] st=0
> >>>> [  100.301640] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 00/09/0001/0000/0000 [out] st=0
> >>>> [  100.335144] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> a0/06/2900/0000/0002 [in] st=0
> >>>> [  100.335178] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> GetHubDescriptor(0)
> >>>> [  100.335196] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> GET_DESCRIPTOR(type:41)
> >>>> [  100.335527] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> a0/06/2900/0000/0009 [in] st=0
> >>>> [  100.335554] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> GetHubDescriptor(0)
> >>>> [  100.335569] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> GET_DESCRIPTOR(type:41)
> >>>> [  100.339672] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/03/0008/0001/0000 [out] st=0
> >>>> [  100.339703] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> SetPortFeature(1,8)
> >>>> [  100.339890] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/03/0008/0002/0000 [out] st=0
> >>>> [  100.339912] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> SetPortFeature(2,8)
> >>>> [  100.340139] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/03/0008/0003/0000 [out] st=0
> >>>> [  100.340160] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> SetPortFeature(3,8)
> >>>> [  100.340386] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/03/0008/0004/0000 [out] st=0
> >>>> [  100.340404] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> SetPortFeature(4,8)
> >>>> [  100.340637] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/03/0008/0005/0000 [out] st=0
> >>>> [  100.340656] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> SetPortFeature(5,8)
> >>>> [  100.360852] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> a0/00/0000/0000/0004 [in] st=0
> >>>> [  100.360884] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> >>>> [  100.500028] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> a3/00/0000/0001/0004 [in] st=0
> >>>> [  100.500062] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>>> [  100.500082] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0101
> >>>> change=0001
> >>>> [  100.500404] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/01/0010/0001/0000 [out] st=0
> >>>> [  100.500435] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> ClearPortFeature(1,16)
> >>>> [  100.615543] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/03/0004/0001/0000 [out] st=0
> >>>> [  100.615579] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> SetPortFeature(1,4)
> >>>> [  100.615594] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 Port reset !
> >>>> [  100.615612] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 0001 -
> >>>>> 0011 (C=0)
> >>>> [  100.615626] aspeed_vhub 1e6a0000.usb-vhub: port1 Reset at unknown
> >>>> speed of disabled device, enabling...
> >>>> [  100.615643] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status 0011 -
> >>>>> 0403 (C=1)
> >>>> [  100.635854] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> a3/00/0000/0001/0004 [in] st=0
> >>>> [  100.635885] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>>> [  100.635903] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503
> >>>> change=0012
> >>>> [  100.636271] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/01/0011/0001/0000 [out] st=0
> >>>> [  100.636299] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> ClearPortFeature(1,17)
> >>>> [  100.636515] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> 23/01/0014/0001/0000 [out] st=0
> >>>> [  100.636540] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>> ClearPortFeature(1,20)
> >>>> [  100.649529] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 00/05/0003/0000/0000 [out] st=0
> >>>> [  100.649564] aspeed_vhub 1e6a0000.usb-vhub: port1 fist packet,
> >>>> captured speed 3
> >>>> [  100.649580] aspeed_vhub 1e6a0000.usb-vhub: port1 SET_ADDRESS: Got
> >>>> address 3
> >>>> [  100.665314] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> a3/00/0000/0001/0004 [in] st=0
> >>>> [  100.665345] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>>> [  100.665363] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503
> >>>> change=0000
> >>>> [  100.680170] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 80/06/0100/0000/0008 [in] st=0
> >>>> [  100.680200] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.680234] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.684627] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 80/06/0100/0000/0012 [in] st=0
> >>>> [  100.684657] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.684690] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.689471] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 80/06/0200/0000/0008 [in] st=0
> >>>> [  100.689500] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.689538] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.693198] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 80/06/0200/0000/0029 [in] st=0
> >>>> [  100.693231] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.693267] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.701949] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 80/06/0300/0000/0002 [in] st=0
> >>>> [  100.701983] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.702020] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.702403] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 80/06/0300/0000/0004 [in] st=0
> >>>> [  100.702432] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.702466] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.702774] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 00/09/0001/0000/0000 [out] st=0
> >>>> [  100.702799] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.702818] configfs-gadget gadget: high-speed config #1: c
> >>>> [  100.708470] aspeed_vhub 1e6a0000.usb-vhub: port1:EP1 Enabling [in]
> >>>> intr num 1 maxpacket=11
> >>>> [  100.708512] aspeed_vhub 1e6a0000.usb-vhub: port1:EP2 Enabling [out]
> >>>> intr num 2 maxpacket=11
> >>>> [  100.708565] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.777585] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 80/08/0000/0000/0001 [in] st=0
> >>>> [  100.777619] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.777649] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.778029] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> a1/03/0000/0000/0001 [in] st=0
> >>>> [  100.778055] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.778085] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.778403] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 21/0b/0000/0000/0000 [out] st=0
> >>>> [  100.778428] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.778457] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> 0
> >>>> [  100.778649] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 21/09/0200/0000/0001 [out] st=0
> >>>> [  100.778672] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.778692] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> -95
> >>>> [  100.778704] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> >>>> [  100.778746] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> >>>> [  100.859563] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>> 21/09/0200/0000/0001 [out] st=0
> >>>> [  100.859592] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding to
> >>>> gadget...
> >>>> [  100.859618] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver returned
> >>>> -95
> >>>> [  100.859633] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> >>>> [  100.892835] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> a3/00/0000/0001/0004 [in] st=0
> >>>> [  100.892866] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>>> [  100.892882] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port status=0503
> >>>> change=0000
> >>>> [  100.893278] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>> a0/00/0000/0000/0004 [in] st=0
> >>>> [  100.893305] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> >>>>
> >>>> Best,
> >>>> Xiuzhi
> >>>>
> >>>> ------------------ Original ------------------
> >>>> From:  "Benjamin Herrenschmidt";<benh@kernel.crashing.org>;
> >>>> Send time: Saturday, Oct 27, 2018 7:55 AM
> >>>> To: "xiuzhi"<1450335857@qq.com>; "Eddie
> >>>> James"<eajames@linux.vnet.ibm.com>; "Joel Stanley"<joel@jms.id.au>;
> >>>> Cc: "openbmc"<openbmc@lists.ozlabs.org>; "Alexander A.
> >>>> Filippov"<a.filippov@yadro.com>;
> >>>> Subject:  Re: Re: VHUB didn't work on AST2500
> >>>>
> >>>>
> >>>>
> >>>> On Fri, 2018-10-26 at 14:34 +0800, xiuzhi wrote:
> >>>>> Hi Eddie,
> >>>>>     Thanks for your reply.
> >>>>> It seemd that the error was caused by the  version dismatch of kernel ,libvncserver ,obmc-ikvm and  vnc client.
> >>>>> Would you like to give me your  git commits numbers of them?
> >>>> It's still a very strange error.
> >>>>
> >>>> Once everything is up to date, let me know if it occurs again, there's
> >>>> something not right going on in the vhub driver causing that state
> >>>> mismatch error, it shouldn't happen. But I haven't managed to reproduce
> >>>> it here.
> >>>>
> >>>> Cheers,
> >>>> Ben.
> >>>>
> >>>>> Best,
> >>>>> xiuzhi
> >>>>> On 10/24/2018 09:52 PM, xiuzhi wrote:
> >>>>>> Hi Ben,
> >>>>>>    I use vncviewer , xtightvncviewer 1.3.9-6.4ubuntu1.
> >>>>>> And I also tested the ikvm by webui
> >>>>>> vnc(_https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/_)
> >>>>>> ,the same errors occured.
> >>>>>> The same source code obmc-ikvm and this  kernel branch video-dev5
> >>>>>> works on my other  AST2400 hardware machine.
> >>>>>> I remembered  only one  kernel version seemed to work on ast2500 ,I
> >>>>>> tested it six weeks ago .
> >>>>>>   the kernel version is:
> >>>>>>
> >>>>>> KBRANCH ?= "video-dev"
> >>>>>> LINUX_VERSION ?= "4.17.11"
> >>>>>> SRCREV="09a65900b2fc7aab9caf9d0dfabc7ba80525b1dd"
> >>>>>> the git repo is from  git://github.com/eddiejames/linux/,
> >>>>>>
> >>>>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11500/5/meta-openbmc-bsp/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb
> >>>>>> I want to test this kernel version ,but now this git repo is not
> >>>>>> available ,
> >>>>>>   I asked Eddiejames week ago, and get no response until now .
> >>>>>>   It is so bad that I did not  backup this kernel on my local machice.
> >>>>> I never made any kernel changes related to USB in my github trees, as
> >>>>> far as I know, so shouldn't be any difference. That original gerrit
> >>>>> commit was purely for our testing purposes for our system... not really
> >>>>> something I can support actively.
> >>>>>
> >>>>> I have a number of commits pending review that you could try and pull in
> >>>>> if you really need this now:
> >>>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/13536/
> >>>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-aspeed/+/13541/
> >>>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/12126/
> >>>>>
> >>>>>
> >>>>> Use these in combination with the two commits at the top of my video-dev
> >>>>> linux tree for your kernel.
> >>>>>
> >>>>> Thanks,
> >>>>> Eddie
> >>>>>
> >>>>>> Best.
> >>>>>> Xiuzhi
> >>>>>> On Thu, 2018-10-25 at 09:39 +0800, xiuzhi wrote:
> >>>>>>> Hi Ben,
> >>>>>>>    I open the CONFIG_USB_GADGET_DEBUG .
> >>>>>>> and input the following keys by order:
> >>>>>>> ';''Enter' :work good,can see ';' on host screen
> >>>>>>> 'a''Enter' :error,see anything on screen
> >>>>>>> 'b''Enter' :error,see anything on screen
> >>>>>>> '1''Enter' :good
> >>>>>>> '2''Enter' :good
> >>>>>>> '3''Enter' :good
> >>>>>>> '4''Enter' :good
> >>>>>>> '5''Enter'  :error deadlock
> >>>>>>> The log is:
> >>>>>> Can you tell me more about the userspace components you use to send
> >>>>>> those keys ? I'd like to try to reproduce here.
> >>>>>>
> >>>>>>> [   78.820671] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request()
> >>>>>> failed for pin 67
> >>>>>>> [   78.828274] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67
> >>>>>> (1e780000.gpio:347) status -1
> >>>>>>> [   80.698564] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request()
> >>>>>> failed for pin 67
> >>>>>>> [   80.706166] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin-67
> >>>>>> (1e780000.gpio:347) status -
> >>>>>>> [   94.447816] udc 1e6a0000.usb-vhub:p1: registering UDC driver
> >>>>>> [obmc_hid]
> >>>>>>> [   94.447909] configfs-gadget gadget: adding 'hid'/15e5a204 to
> >>>>>> config 'c'/70dd0747
> >>>>>>> [   94.447940] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> >>>>>>> [   94.447958] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen
> >>>>>> EP 0 for addr 1
> >>>>>>> [   94.448474] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#0
> >>>>>> for port EP1
> >>>>>>> [   94.448505] aspeed_vhub 1e6a0000.usb-vhub: port1 Match EP type 3
> >>>>>>> [   94.448522] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocating gen
> >>>>>> EP 1 for addr 2
> >>>>>>> [   94.448780] aspeed_vhub 1e6a0000.usb-vhub: port1 Allocated epn#1
> >>>>>> for port EP2
> >>>>>>> [   94.449270] aspeed_vhub 1e6a0000.usb-vhub: port1 start
> >>>>>>> [   94.449297] aspeed_vhub 1e6a0000.usb-vhub: port1 pullup(1)
> >>>>>>> [   94.449317] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status
> >>>>>> 0000 -> 0001 (C=1)
> >>>>>>> [  100.158377] aspeed_vhub 1e6a0000.usb-vhub: USB bus resume
> >>>>>>> [  100.158400] configfs-gadget gadget: resume
> >>>>>>> [  100.158415] aspeed_vhub 1e6a0000.usb-vhub: USB bus reset
> >>>>>>> [  100.301048] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 00/05/0002/0000/0000 [out] st=0
> >>>>>>> [  100.301081] aspeed_vhub 1e6a0000.usb-vhub: USB status=0b100000
> >>>>>> speed=high
> >>>>>>> [  100.301096] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SET_ADDRESS:
> >>>>>> Got address 2
> >>>>>>> [  100.322061] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 80/06/0100/0000/0008 [in] st=0
> >>>>>>> [  100.322090] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> GET_DESCRIPTOR(type:1)
> >>>>>>> [  100.326625] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 80/06/0100/0000/0012 [in] st=0
> >>>>>>> [  100.326656] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> GET_DESCRIPTOR(type:1)
> >>>>>>> [  100.331359] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 80/06/0200/0000/0008 [in] st=0
> >>>>>>> [  100.331392] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> GET_DESCRIPTOR(type:2)
> >>>>>>> [  100.335194] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 80/06/0200/0000/0019 [in] st=0
> >>>>>>> [  100.335221] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> GET_DESCRIPTOR(type:2)
> >>>>>>> [  100.343939] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 80/06/0300/0000/0002 [in] st=0
> >>>>>>> [  100.344272] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 80/06/0300/0000/0004 [in] st=0
> >>>>>>> [  100.344647] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 00/09/0001/0000/0000 [out] st=0
> >>>>>>> [  100.378145] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> a0/06/2900/0000/0002 [in] st=0
> >>>>>>> [  100.378178] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> GetHubDescriptor(0)
> >>>>>>> [  100.378195] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> GET_DESCRIPTOR(type:41)
> >>>>>>> [  100.378522] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> a0/06/2900/0000/0009 [in] st=0
> >>>>>>> [  100.378546] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> GetHubDescriptor(0)
> >>>>>>> [  100.378560] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> GET_DESCRIPTOR(type:41)
> >>>>>>> [  100.382665] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/03/0008/0001/0000 [out] st=0
> >>>>>>> [  100.382697] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> SetPortFeature(1,8)
> >>>>>>> [  100.382896] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/03/0008/0002/0000 [out] st=0
> >>>>>>> [  100.382922] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> SetPortFeature(2,8)
> >>>>>>> [  100.383148] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/03/0008/0003/0000 [out] st=0
> >>>>>>> [  100.383173] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> SetPortFeature(3,8)
> >>>>>>> [  100.383396] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/03/0008/0004/0000 [out] st=0
> >>>>>>> [  100.383422] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> SetPortFeature(4,8)
> >>>>>>> [  100.383643] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/03/0008/0005/0000 [out] st=0
> >>>>>>> [  100.383668] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> SetPortFeature(5,8)
> >>>>>>> [  100.403844] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> a0/00/0000/0000/0004 [in] st=0
> >>>>>>> [  100.403871] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> >>>>>>> [  100.549225] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> a3/00/0000/0001/0004 [in] st=0
> >>>>>>> [  100.549257] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>>>>>> [  100.549275] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port
> >>>>>> status=0101 change=0001
> >>>>>>> [  100.549651] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/01/0010/0001/0000 [out] st=0
> >>>>>>> [  100.549681] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> ClearPortFeature(1,16)
> >>>>>>> [  100.664592] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/03/0004/0001/0000 [out] st=0
> >>>>>>> [  100.664625] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> SetPortFeature(1,4)
> >>>>>>> [  100.664639] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 Port reset !
> >>>>>>> [  100.664658] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status
> >>>>>> 0001 -> 0011 (C=0)
> >>>>>>> [  100.664672] aspeed_vhub 1e6a0000.usb-vhub: port1 Reset at unknown
> >>>>>> speed of disabled device, enabling.
> >>>>>>> [  100.664689] aspeed_vhub 1e6a0000.usb-vhub: port1 port 1 status
> >>>>>> 0011 -> 0403 (C=1)
> >>>>>>> [  100.684840] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> a3/00/0000/0001/0004 [in] st=0
> >>>>>>> [  100.684867] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>>>>>> [  100.684885] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port
> >>>>>> status=0503 change=0012
> >>>>>>> [  100.685276] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/01/0011/0001/0000 [out] st=0
> >>>>>>> [  100.685306] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> ClearPortFeature(1,17)
> >>>>>>> [  100.685518] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> 23/01/0014/0001/0000 [out] st=0
> >>>>>>> [  100.685544] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0
> >>>>>> ClearPortFeature(1,20)
> >>>>>>> [  100.698539] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 00/05/0003/0000/0000 [out] st=0
> >>>>>>> [  100.698568] aspeed_vhub 1e6a0000.usb-vhub: port1 fist packet,
> >>>>>> captured speed 3
> >>>>>>> [  100.698585] aspeed_vhub 1e6a0000.usb-vhub: port1 SET_ADDRESS: Got
> >>>>>> address 3
> >>>>>>> [  100.714314] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> a3/00/0000/0001/0004 [in] st=0
> >>>>>>> [  100.714339] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>>>>>> [  100.714354] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port
> >>>>>> status=0503 change=0000
> >>>>>>> [  100.729165] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 80/06/0100/0000/0008 [in] st=0
> >>>>>>> [  100.729195] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.729227] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.733627] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 80/06/0100/0000/0012 [in] st=0
> >>>>>>> [  100.733658] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.733690] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.738363] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 80/06/0200/0000/0008 [in] st=0
> >>>>>>> [  100.738391] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.738427] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.742195] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 80/06/0200/0000/0029 [in] st=0
> >>>>>>> [  100.742225] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.742262] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.750944] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 80/06/0300/0000/0002 [in] st=0
> >>>>>>> [  100.750972] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.751006] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.751400] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 80/06/0300/0000/0004 [in] st=0
> >>>>>>> [  100.751425] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.751455] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.751777] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 00/09/0001/0000/0000 [out] st=0
> >>>>>>> [  100.751803] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.751821] configfs-gadget gadget: high-speed config #1: c
> >>>>>>> [  100.757460] aspeed_vhub 1e6a0000.usb-vhub: port1:EP1 Enabling
> >>>>>> [in] intr num 1 maxpacket=11
> >>>>>>> [  100.757502] aspeed_vhub 1e6a0000.usb-vhub: port1:EP2 Enabling
> >>>>>> [out] intr num 2 maxpacket=11
> >>>>>>> [  100.757549] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.820566] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 80/08/0000/0000/0001 [in] st=0
> >>>>>>> [  100.820594] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.820621] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.821026] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> a1/03/0000/0000/0001 [in] st=0
> >>>>>>> [  100.821050] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.821076] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.821397] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 21/0b/0000/0000/0000 [out] st=0
> >>>>>>> [  100.821422] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.821451] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned 0
> >>>>>>> [  100.821643] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 21/09/0200/0000/0001 [out] st=0
> >>>>>>> [  100.821666] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.821685] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned -95
> >>>>>>> [  100.821697] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> >>>>>>> [  100.821735] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> >>>>>>> [  100.913006] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 SETUP packet
> >>>>>> 21/09/0200/0000/0001 [out] st=0
> >>>>>>> [  100.913034] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 forwarding
> >>>>>> to gadget...
> >>>>>>> [  100.913056] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 driver
> >>>>>> returned -95
> >>>>>>> [  100.913067] aspeed_vhub 1e6a0000.usb-vhub: port1:EP0 stalling
> >>>>>>> [  100.946228] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> a3/00/0000/0001/0004 [in] st=0
> >>>>>>> [  100.946257] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetPortStatus(1)
> >>>>>>> [  100.946274] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0  port
> >>>>>> status=0503 change=0000
> >>>>>>> [  100.946645] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 SETUP packet
> >>>>>> a0/00/0000/0000/0004 [in] st=0
> >>>>>>> [  100.946672] aspeed_vhub 1e6a0000.usb-vhub: hub:EP0 GetHubStatus
> >>>>>>> [  399.741059] aspeed_vhub 1e6a0000.usb-vhub: USB bus suspend
> >>>>>>> [  399.741081] configfs-gadget gadget: suspend
> >>>>>>> Best,
> >>>>>>> Xiuzhi
> >>>>>>>
> >>>>>>> ------------------ Original ------------------
> >>>>>>> From:  "Benjamin Herrenschmidt";<benh@kernel.crashing.org>;
> >>>>>>> Send time: Thursday, Oct 25, 2018 6:42 AM
> >>>>>>> To: "Joel Stanley"<joel@jms.id.au>; "xiuzhi"<1450335857@qq.com>;
> >>>>>>> Cc: "a.filippov"<a.filippov@yadro.com>; "OpenBMC
> >>>>>> Maillist"<openbmc@lists.ozlabs.org>;
> >>>>>>> Subject:  Re: VHUB didn't work on AST2500
> >>>>>>>
> >>>>>>> On Wed, 2018-10-24 at 17:02 +1030, Joel Stanley wrote:
> >>>>>>>> On Wed, 24 Oct 2018 at 17:00, xiuzhi <1450335857@qq.com> wrote:
> >>>>>>>>>   I am porting obmc-ikvm to my hardware platform. The host screen
> >>>>>> can be seen by vncviewer , but the mouse and keyboard didn't work on
> >>>>>> AST2500
> >>>>>>>>> . Only the keys ';' , 'Enter',  '1','2','3','4' work. others
> >>>>>> keyinput will deadlock the host screen .
> >>>>>>>>> The kernel error log:
> >>>>>>>>> [   99.326586] configfs-gadget gadget: high-speed config #1: c
> >>>>>>>>> [   99.403704] aspeed_vhub 1e6a0000.usb-vhub: status direction
> >>>>>> mismatch
> >>>>>>>>> [   99.492831] aspeed_vhub 1e6a0000.usb-vhub: status direction
> >>>>>> mismatch
> >>>>>>>>> The kernel version is : video-dev5,
> >>>>>>>>> commit 2acbc35adcfe15971b701770e1105276a18da9f7
> >>>>>>>>>
> >>>>>>>>> Who can give me some suggestions to  debug it?
> >>>>>>>> Ben, do you have any advice?
> >>>>>>> I need to know a bit more. What is used as a gadget driver on the BMC ?
> >>>>>>>
> >>>>>>> I would probably need to reproduce with some added traces to the driver
> >>>>>>> to figure out what's going on.
> >>>>>>>
> >>>>>>> One first thing to try would be a run with CONFIG_USB_GADGET_DEBUG
> >>>>>>> along with some indication of what actions happen corresponding to what
> >>>>>>> part of the log (ie, press key 'a' etc...).
> >>>>>>>
> >>>>>>> Cheers,
> >>>>>>> Ben.
> >>>>>>>
> >
> 
