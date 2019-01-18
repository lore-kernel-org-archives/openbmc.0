Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cNfCRpd2"; 
 dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43hF164bq4zDr7x
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 08:47:54 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id b14so12296959edt.6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 13:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AUc5aTb6Y5AeerB8dcNljNHdwfB6np31Q5bxZRoF/a0=;
 b=cNfCRpd2zUyn/eG9wm1nc33CsYRK3pOfBHycksOCQjdb84z5Kg5wS+l8ZdxpH4CHCQ
 LPaQ4nlIwU3nPA+KXwghTHbk7WLoE9wyudnqUbo8pokau1nuGYhhXPeaf2lMD9xYWHag
 pUBQNkSvCZVhvQWLu2cnlvjV/tAP3aEDwQ0NRMWVgjLNshh0Z8gJfRh6UeRrcXekWunA
 hHUtmTdkPJmqRwpMFuqtf3Qi/OgS5HJ4LJGPn6GErsodiXdC5k7Chu+IIILsU1jvuSO9
 4cdd0yTsRVQLZaMZsunuhQuDVj4qv9d53A+AcovCdrDe8GjAYjyQ0VzFnMtjS196rj2s
 QLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AUc5aTb6Y5AeerB8dcNljNHdwfB6np31Q5bxZRoF/a0=;
 b=gl9cL1s2UhkKfANNtOXHCF9xYh/uM+AYU/JQWvk9QQiKE1QkBrSFTiUyXxVhYQtUu0
 PI69NHgKxqMhGtDOCtyXCdg6xxc1Ynj06M5hxr1pzN0RNbruzT4a8+/dZ4MC77jYl6VU
 w7wHU95TC14q4MbkqjCuR1vJU4KMwmnpWPNxGr4axuNV7mHnDcBE6O6/+o61dQE3BmWy
 T9Ly+Q3/5RcGnSBi9HznrDAU4XInCo9TC4I2buVg7M8MysHMtaANZa65gxPHlEK8Avur
 0D9lHGX7V6VdlfINRiLxpzdm5ecF4FDlTpZ/LwuEkg0ngQ5ua9eh5CIqs2vELx/03XYp
 Jn2g==
X-Gm-Message-State: AJcUukeucSgK6OKlbG8ROHeJxq2QiKULDztxIsNsSiMN6/DjSZSsuOUJ
 kOZMvmtMq7LT0yak83go4Lts1b3NPhorr1e7Kq1+ED7QY7Y=
X-Google-Smtp-Source: ALg8bN6BTCW9RpCVpx9zAJnHMZtFROOZeD4oc7yv1zMP32APTaCSNwW5zKB7aE0yMDHhxLXzlEcYwOlYS42XbpjBzmA=
X-Received: by 2002:a05:6402:13d6:: with SMTP id
 a22mr16823124edx.39.1547848071037; 
 Fri, 18 Jan 2019 13:47:51 -0800 (PST)
MIME-Version: 1.0
References: <DE46657A-3E0D-445B-AE97-987C3E54C1D7@fb.com>
In-Reply-To: <DE46657A-3E0D-445B-AE97-987C3E54C1D7@fb.com>
From: Oskar Senft <osk@google.com>
Date: Fri, 18 Jan 2019 16:47:39 -0500
Message-ID: <CABoTLcQjC2=pRYmX3EdBdhY8qtw8a7UKDKq1ueLRf5DHLn6fJg@mail.gmail.com>
Subject: Re: AMI Bios not booting completely
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000719696057fc276c9"
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
X-List-Received-Date: Fri, 18 Jan 2019 21:47:56 -0000

--000000000000719696057fc276c9
Content-Type: text/plain; charset="UTF-8"

What really peaks out is that it stops just as it's trying to initialize
the DXE serial driver ... Is it possible that this driver is attempting to
access a resource that's not exposed or not handled through/by OpenBMC?

Oskar.

On Fri, Jan 18, 2019 at 2:33 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Team,
>
> I am unable to boot Bios all the way to boot  (grub in our case) prompt.
> I have verified IPMI communication with KCS debug. It does work with our FB
> internal image but not with LF openbmc image. Following is the last log
> lines and it get stuck after that.
>
>
>
> InstallRom...Run-time ROM Size = 8000 Bytes
>
> FetchBbsBootDevices: B3/D0/F0, ClassCode 3
>
> InstallProtocolInterface: OpromStartEnd 0
>
> OnPciIOInstalled
>
> OnPciIOInstalled LocateHandle = Success
>
> OnPciIOInstalled HandleProtocol = Success
>
> OpRomStartEndProtocol located
>
>                PCI OPROM(handle 66307C98, 3/0/0): addr C0000, size 8000
>
> InstallProtocolInterface: EfiDevicePath 65EAE9D8
>
> VESA: fetching the list of VESA modes supported by the controller from
> 3F022
>
> VESA mode 101 (640x480)  skipping as BPP (8) is less than 24...
>
> VESA mode 102 (800x600)  skipping as the mode has not linear frame
> buffer...
>
> VESA mode 103 (800x600)  skipping as BPP (8) is less than 24...
>
> VESA mode 105 (1024x768)  skipping as BPP (8) is less than 24...
>
> VESA mode 110 (640x480)  skipping as BPP (15) is less than 24...
>
> VESA mode 111 (640x480)  skipping as BPP (16) is less than 24...
>
> VESA mode 113 (800x600)  skipping as BPP (15) is less than 24...
>
> VESA mode 114 (800x600)  skipping as BPP (16) is less than 24...
>
> VESA mode 116 (1024x768)  skipping as BPP (15) is less than 24...
>
> VESA mode 117 (1024x768)  skipping as BPP (16) is less than 24...
>
> VESA mode 120 (640x480)  neither EDID nor MODE match is found.
>
> VESA mode 121 (800x600)  MODE match found (0).
>
> ODE match found (2).
>
> VESA mode 122 (1024x768)  neither EDID nor MODE match is found.
>
> VESA mode 130 (320x240)  skipping as BPP (8) is less than 24...
>
> VESA mode 131 (320x240)  skipping as BPP (15) is less than 24...
>
> VESA mode 132 (320x240)  skipping as BPP (16) is less than 24...
>
> VESA mode 133 (320x240)  neither EDID nor MODE match is found.
>
> VESA mode 134 (400x300)  skipping as BPP (8) is less than 24...
>
> VESA mode 135 (400x300)  skipping as BPP (15) is less than 24...
>
> VESA mode 136 (400x300)  skipping as BPP (16) is less than 24...
>
> VESA mode 137 (400x300)  neither EDID nor MODE match is found.
>
> VESA mode 138 (512x384)  skipping as BPP (8) is less than 24...
>
> VESA mode 139 (512x384)  skipping as BPP (15) is less than 24...
>
> VESA mode 13A (512x384)  skipping as BPP (16) is less than 24...
>
> VESA mode 13B (512x384)  neither EDID nor MODE match is found.
>
> Total number of GOP modes: 1
>
> UefiBiosVideo AllocateTheBuffers()
>
> VbeModeNumber: 0x121
>
> BytesPerScanLine: 0xC80
>
> HorizontalResolution: 0x320
>
> VerticalResolution: 0x258
>
> axBytesPerScanLine: 0xC80
>
> axVerticalResolution: 0x258
>
> InstallProtocolInterface: EfiGraphicsOutput 65EABB38[24m
>
> [4mInstallProtocolInterface: EfiEdidDiscovered 65EABB58[24m
>
> [4mInstallProtocolInterface: EfiEdidActive 65EABB68[24m
>
>
>
> [4mOptRomSetup: GOP Protocol Installed, EVENT=0x68A8FB98.[24m
>
> [4mOptRomSetup: ChkVga - VGA Settings: VgaIdx=0x14D; Item=1; Group=2;
> cbMode=1; GopFound=1;[24m
>
> [4mSuccess[24m
>
> [4mAMI Graphic Console
> Driver.Start(6A4C081C)[PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)/Pci(0x0,0x0)/AcpiAdr(0x80010100)]=InstallProtocolInterface:
> EfiSimpleTextOut 65EAE298[24m
>
> [4mInstallProtocolInterface: AmiTextOut 65EAE399[24m
>
> [4mSuccess[24m
>
> [4mAMI Console Splitter Text Out
> Driver.Start(6A4C80B0)[PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)/Pci(0x0,0x0)/AcpiAdr(0x80010100)]=[24m
>
> [4mRows = 19  Col = 50    AllDevices = 1 [24m
>
> [4mRows = 19  Col = 50    AllDevices = 0 [24m
>
> [4mRows = 1F  Col = 64    AllDevices = 1 [24m
>
> [4mRows = 1F  Col = 64    AllDevices = 1 [24m
>
> [4mSuccess[24m
>
> [4mBDS.ConnectConOutVariable(6A730CF8)[24m
>
> [4mAMI Serial I/O
> Driver.Start(6A64A87C)[PciRoot(0x0)/Pci(0x1F,0x0)/Serial(0x0);Uart(InstallProtocolInterface:
> EfiSerialIo 65EAB298[24m
>
> [4mInstallProtocolInterface: EfiDevicePath 65C9D818[24m
>
> [4mSuccess[24m
>
> [4mAMI Terminal
> Driver.Start(6A47662C)[PciRoot(0x0)/Pci(0x1F,0x0)/Serial(0x0)/Uart(57600,8,N,1)/UartFlowCtrl(Hardware);VenVt100()]=ACPI:
> SetAcpiTable() Table=0x65C9D2D8; Handle=0x6A47D530; *Handle=0x0[24m
>
> [4mACPI: SetAcpiTable() Exiting... Status = Success[24m
>
> [4mInstallProtocolInterface: EfiDevicePath 68A46D18[24m
>
> [H[2J[61B[H[4mInstallProtocolInterface: EfiSimpleTextIn 68A45018
>
> InstallProtocolInterface: EfiSimpleTextInputEx 68A45030
>
> InstallProtocolInterface: AmiEfiKeycode 68A45060
>
> InstallProtocolInterface: EfiSimpleTextOut 68A45090
>
> Success
>
> AMI Console Splitter Text Out
> Driver.Start(6A4C80B0)[PciRoot(0x0)/Pci(0x1F,0x0)/Serial(0x0)/Uart(57600,8,N,1)/UartFlowCtrl(Hardware)/VenVt100()]=
>
> Rows = 19  Col = 50    AllDevices = 1
>
> [24m[H[2J[7B[H[25;60HSuccess
>
> AMI Console Splitter Text In
> Driver.Start(6A4C84C4)[PciRoot(0x0)/Pci(0x1F,0x0)/Serial(0x0)/Uart(57600,8,N,1)/UartFlowCtrl(Hardware)/VenVt100()]=Success
>
> AMI Serial I/O
> Driver.Start(6A64A87C)[PciRoot(0x0)/Pci(0x1F,0x0)/Serial(0x1);Uart(57600,8,N,1)]=
>
>
>
>
>
> Please throw some light here.
>
>
>
> Regards
>
> -Vijay
>

--000000000000719696057fc276c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What really peaks out is that it stops just as it&#39;s tr=
ying to initialize the DXE serial driver ... Is it possible that this drive=
r is attempting to access a resource that&#39;s not exposed or not handled =
through/by OpenBMC?<div><br></div><div>Oskar.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">On Fri, Jan 18, 2019 at 2:33 PM Vijay Khemka =
&lt;<a href=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-6498760784469360057WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Team,<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I am unable to boot B=
ios all the way to boot=C2=A0 (grub in our case) prompt.=C2=A0 I have verif=
ied IPMI communication with KCS debug. It does work with our FB internal im=
age but not with LF openbmc image. Following
 is the last log lines and it get stuck after that.<u></u><u></u></span></p=
>
<div style=3D"border-top:none;border-right:none;border-left:none;border-bot=
tom:2.25pt double windowtext;padding:0in 0in 1pt">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">InstallRom...Run-time ROM Size =3D 8000 Bytes</span><u></u>=
<u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">FetchBbsBootDevices: B3/D0/F0, ClassCode 3</span><u></u><u>=
</u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">InstallProtocolInterface: OpromStartEnd 0</span><u></u><u><=
/u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">OnPciIOInstalled</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">OnPciIOInstalled LocateHandle =3D Success</span><u></u><u><=
/u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">OnPciIOInstalled HandleProtocol =3D Success</span><u></u><u=
></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">OpRomStartEndProtocol located</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057apple-converted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 </span><span class=3D"gmail-m_-6498760784469360057s1">PCI OP=
ROM(handle 66307C98, 3/0/0): addr C0000, size 8000</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">InstallProtocolInterface: EfiDevicePath 65EAE9D8</span><u><=
/u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA: fetching the list of VESA modes supported by the cont=
roller from 3F022</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 101 (640x480)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (8) i=
s less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 102 (800x600)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as the mode =
has not linear frame buffer...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 103 (800x600)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (8) i=
s less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 105 (1024x768)</span><span class=3D"gmail-m_-6498=
760784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (8) i=
s less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 110 (640x480)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (15) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 111 (640x480)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (16) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 113 (800x600)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (15) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 114 (800x600)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (16) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 116 (1024x768)</span><span class=3D"gmail-m_-6498=
760784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (15) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 117 (1024x768)</span><span class=3D"gmail-m_-6498=
760784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (16) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 120 (640x480)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">neither EDID nor MODE=
 match is found.</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 121 (800x600)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">MODE match found (0).=
</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">ODE match found (2).</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 122 (1024x768)</span><span class=3D"gmail-m_-6498=
760784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">neither EDID nor MODE=
 match is found.</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 130 (320x240)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (8) i=
s less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 131 (320x240)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (15) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 132 (320x240)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (16) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 133 (320x240)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">neither EDID nor MODE=
 match is found.</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 134 (400x300)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (8) i=
s less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 135 (400x300)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (15) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 136 (400x300)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (16) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 137 (400x300)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">neither EDID nor MODE=
 match is found.</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 138 (512x384)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (8) i=
s less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 139 (512x384)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (15) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 13A (512x384)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">skipping as BPP (16) =
is less than 24...</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VESA mode 13B (512x384)</span><span class=3D"gmail-m_-64987=
60784469360057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">neither EDID nor MODE=
 match is found.</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">Total number of GOP modes: 1</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">UefiBiosVideo AllocateTheBuffers()</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VbeModeNumber: 0x121</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">BytesPerScanLine: 0xC80</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">HorizontalResolution: 0x320</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">VerticalResolution: 0x258</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">axBytesPerScanLine: 0xC80</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">axVerticalResolution: 0x258</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">InstallProtocolInterface: EfiGraphicsOutput 65EABB38[24m</s=
pan><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mInstallProtocolInterface: EfiEdidDiscovered 65EABB58[24m=
</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mInstallProtocolInterface: EfiEdidActive 65EABB68[24m</sp=
an><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p2"><u></u>=C2=A0<u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mOptRomSetup: GOP Protocol Installed, EVENT=3D0x68A8FB98.=
[24m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mOptRomSetup: ChkVga - VGA Settings: VgaIdx=3D0x14D; Item=
=3D1; Group=3D2; cbMode=3D1; GopFound=3D1;[24m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mSuccess[24m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mAMI Graphic Console Driver.Start(6A4C081C)[PciRoot(0x0)/=
Pci(0x1C,0x4)/Pci(0x0,0x0)/Pci(0x0,0x0)/AcpiAdr(0x80010100)]=3DInstallProto=
colInterface: EfiSimpleTextOut 65EAE298[24m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mInstallProtocolInterface: AmiTextOut 65EAE399[24m</span>=
<u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mSuccess[24m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mAMI Console Splitter Text Out Driver.Start(6A4C80B0)[Pci=
Root(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)/Pci(0x0,0x0)/AcpiAdr(0x80010100)]=3D[2=
4m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mRows =3D 19</span><span class=3D"gmail-m_-64987607844693=
60057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">Col =3D 50</span><spa=
n class=3D"gmail-m_-6498760784469360057apple-converted-space">=C2=A0 =C2=A0=
 </span>
<span class=3D"gmail-m_-6498760784469360057s1">AllDevices =3D 1 [24m</span>=
<u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mRows =3D 19</span><span class=3D"gmail-m_-64987607844693=
60057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">Col =3D 50</span><spa=
n class=3D"gmail-m_-6498760784469360057apple-converted-space">=C2=A0 =C2=A0=
 </span>
<span class=3D"gmail-m_-6498760784469360057s1">AllDevices =3D 0 [24m</span>=
<u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mRows =3D 1F</span><span class=3D"gmail-m_-64987607844693=
60057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">Col =3D 64</span><spa=
n class=3D"gmail-m_-6498760784469360057apple-converted-space">=C2=A0 =C2=A0=
 </span>
<span class=3D"gmail-m_-6498760784469360057s1">AllDevices =3D 1 [24m</span>=
<u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mRows =3D 1F</span><span class=3D"gmail-m_-64987607844693=
60057apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">Col =3D 64</span><spa=
n class=3D"gmail-m_-6498760784469360057apple-converted-space">=C2=A0 =C2=A0=
 </span>
<span class=3D"gmail-m_-6498760784469360057s1">AllDevices =3D 1 [24m</span>=
<u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mSuccess[24m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mBDS.ConnectConOutVariable(6A730CF8)[24m</span><u></u><u>=
</u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mAMI Serial I/O Driver.Start(6A64A87C)[PciRoot(0x0)/Pci(0=
x1F,0x0)/Serial(0x0);Uart(InstallProtocolInterface: EfiSerialIo 65EAB298[24=
m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mInstallProtocolInterface: EfiDevicePath 65C9D818[24m</sp=
an><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mSuccess[24m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mAMI Terminal Driver.Start(6A47662C)[PciRoot(0x0)/Pci(0x1=
F,0x0)/Serial(0x0)/Uart(57600,8,N,1)/UartFlowCtrl(Hardware);VenVt100()]=3DA=
CPI: SetAcpiTable() Table=3D0x65C9D2D8; Handle=3D0x6A47D530; *Handle=3D0x0[=
24m</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mACPI: SetAcpiTable() Exiting... Status =3D Success[24m</=
span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[4mInstallProtocolInterface: EfiDevicePath 68A46D18[24m</sp=
an><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[H[2J[61B[H[4mInstallProtocolInterface: EfiSimpleTextIn 68A=
45018</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">InstallProtocolInterface: EfiSimpleTextInputEx 68A45030</sp=
an><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">InstallProtocolInterface: AmiEfiKeycode 68A45060</span><u><=
/u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">InstallProtocolInterface: EfiSimpleTextOut 68A45090</span><=
u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">Success</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">AMI Console Splitter Text Out Driver.Start(6A4C80B0)[PciRoo=
t(0x0)/Pci(0x1F,0x0)/Serial(0x0)/Uart(57600,8,N,1)/UartFlowCtrl(Hardware)/V=
enVt100()]=3D</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">Rows =3D 19</span><span class=3D"gmail-m_-64987607844693600=
57apple-converted-space">=C2=A0
</span><span class=3D"gmail-m_-6498760784469360057s1">Col =3D 50</span><spa=
n class=3D"gmail-m_-6498760784469360057apple-converted-space">=C2=A0 =C2=A0=
 </span>
<span class=3D"gmail-m_-6498760784469360057s1">AllDevices =3D 1</span><u></=
u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">[24m[H[2J[7B[H[25;60HSuccess</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">AMI Console Splitter Text In Driver.Start(6A4C84C4)[PciRoot=
(0x0)/Pci(0x1F,0x0)/Serial(0x0)/Uart(57600,8,N,1)/UartFlowCtrl(Hardware)/Ve=
nVt100()]=3DSuccess</span><u></u><u></u></p>
<p class=3D"gmail-m_-6498760784469360057p1"><span class=3D"gmail-m_-6498760=
784469360057s1">AMI Serial I/O Driver.Start(6A64A87C)[PciRoot(0x0)/Pci(0x1F=
,0x0)/Serial(0x1);Uart(57600,8,N,1)]=3D</span><u></u><u></u></p>
<div style=3D"border-top:none;border-right:none;border-left:none;border-bot=
tom:2.25pt double windowtext;padding:0in 0in 1pt">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Please throw some lig=
ht here.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Regards<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-Vijay<u></u><u></u><=
/span></p>
</div>
</div>

</blockquote></div>

--000000000000719696057fc276c9--
