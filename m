Return-Path: <jaghu@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::236; helo=mail-oi0-x236.google.com;
 envelope-from=jaghu@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oLRV9VK0"; 
 dkim-atps=neutral
Received: from mail-oi0-x236.google.com (mail-oi0-x236.google.com
 [IPv6:2607:f8b0:4003:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 426QYz53Q8zF3TG
 for <openbmc@lists.ozlabs.org>; Sat,  8 Sep 2018 04:14:14 +1000 (AEST)
Received: by mail-oi0-x236.google.com with SMTP id b15-v6so28853644oib.10
 for <openbmc@lists.ozlabs.org>; Fri, 07 Sep 2018 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/PuPtPkzSrtc6wyQOg5y63x1ViJY2PKX3IP9iRNeXgI=;
 b=oLRV9VK0GpM8fd1mtQ+Tae1P5RRZCwIfvu5R1VtKOYNKf5uNSOJapzS93i0GLasNdf
 fJnP11FkmO/7eBGg8YXv+deCC7Dm5kNmAxc4QxMRlXMtjQLtmKaWtPtIvCn1voGk7m6U
 JE3+oQ5gkXJQjpEzRu1fO1aoWlqx1FvVH2u/ruhlyjG5UlE4QAROKbmbs6DlnNNuf4sM
 V3Gk1oMEH2oNDaNxG4fjk7dxg8QyMh+Ju7HV/+W8wDGM3f5RpV2thjkq9+vr/gekZrnA
 aXbpHbzAG5TnrTazDpGjEwuU8Cstqj/k53hx9x5ztPUiaAXWhsVm58mSN53pMC5xuAt7
 h4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/PuPtPkzSrtc6wyQOg5y63x1ViJY2PKX3IP9iRNeXgI=;
 b=kUaNrTe48giQFGz+COlZrwr/H0dk3/J3Tytd1n0PHLaXptD9jxsOXJM8lBpLdAzkeh
 Ia2joo3fvNqzUZtNtCz2+fMXF7n/BIhalTmAFW7/4ZygEgjmQlWYN9sJon+8kww6w/mE
 5Hv4Z7xyjE8o3YH9MIUFTbVGYtJ74sDDD1nwfm2i8EaIjW/gJ+xM48zMb2Aa4uZGJMPu
 OA0tRgHDC5gSTxbZvJhStanBji1CZsOZwZI+rz0VfomclgAUK799ZND8kme1JG+frLyF
 mWAxsg0M6Q660aDBvkU5Qqoe1ZKwycDzblxFf3uvr92EANOBliFAyBXYm318IICaUipa
 6Ybg==
X-Gm-Message-State: APzg51CY2n6g8pu7F98FYtbWULCJ1Y+miSXoONlNbX9sYmR9JhLOBt0f
 mQvPUbumcXHsu/5jjj/7Z9NghP3ZAqPjAn09pyHqha8r9l8=
X-Google-Smtp-Source: ANB0VdZABM6dSeeItMUEps629qgbdmv/W4jX8SOb+2Ma0EghubRt76ofMDCaQTUpvXkKF31VgWBaIMPsIvmKLButXB4=
X-Received: by 2002:aca:32d5:: with SMTP id
 y204-v6mr9622568oiy.85.1536344052297; 
 Fri, 07 Sep 2018 11:14:12 -0700 (PDT)
MIME-Version: 1.0
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Fri, 7 Sep 2018 11:14:01 -0700
Message-ID: <CANsWYUXTy6b_gpw7z7DWT=DoHBZThtqHJyM5cs-BCBhKFH_tow@mail.gmail.com>
Subject: Question about IPMI OEM command to expose PCIe slot-i2c mapping.
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000007df9a705754bf9db"
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
X-List-Received-Date: Fri, 07 Sep 2018 18:14:17 -0000

--0000000000007df9a705754bf9db
Content-Type: text/plain; charset="UTF-8"

Hello,

BMC has information in the device tree about which I2C bus goes to which
PCIe slot. I would like the host to get this information from the BMC
firmware by sending a IPMI OEM command.

How I want to do this:
(for example in arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts file, I
want to add an extra attribute "slot" for each I2C bus, which
indicates which i2c bus goes to which PCIe slot )
&i2c2 {
status = "okay";

/* 0: PCIe Slot 2,
*    Slot 3,
*    Slot 6,
*    Slot 7
*/i2c-switch at 74 <https://lists.ozlabs.org/listinfo/openbmc> {
compatible = "nxp,pca9546";
reg = <0x74>;
#address-cells = <1>;
#size-cells = <0>;
i2c-mux-idle-disconnect;  /* may use mux at 77
<https://lists.ozlabs.org/listinfo/openbmc> next. */

i2c_pcie2: i2c at 0 <https://lists.ozlabs.org/listinfo/openbmc> {
#address-cells = <1>;
#size-cells = <0>;
reg = <0>;

----->slot = "PE2";<-----

};

i2c_pcie3: i2c at 1 <https://lists.ozlabs.org/listinfo/openbmc> {
#address-cells = <1>; #size-cells = <0>; reg = <1>;

----->slot = "PE2";<-----

}; } Whenever the host sends the IPMI OEM command to get the I2C bus/PCIe
slot mapping info, the BMC can parse through all the i2c devices under
/sys/bus/i2c/ and find all the i2c devices which have a property called
slot under of_node. The BMC firmware can then send the I2C bus number and
the slot name for all the i2c devices found above, as part of the IPMI
command response. Does anyone have any ideas/suggestions about this ?

--0000000000007df9a705754bf9db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)">Hello=
,

BMC has information in the device tree about which I2C bus goes to which
PCIe slot. I would like the host to get this information from the BMC firmw=
are by sending a IPMI OEM command.<br></pre><pre style=3D"white-space:pre-w=
rap;color:rgb(0,0,0)">How I want to do this:
(for example in arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts file, I want t=
o add an extra attribute &quot;slot&quot; for each I2C bus, which indicates=
 which i2c bus goes to which PCIe slot )
&amp;i2c2 {
status =3D &quot;okay&quot;;

/* 0: PCIe Slot 2,
*    Slot 3,
*    Slot 6,
*    Slot 7
*/
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" target=3D"_blank">i2c=
-switch at 74</a> {
compatible =3D &quot;nxp,pca9546&quot;;
reg =3D &lt;0x74&gt;;
#address-cells =3D &lt;1&gt;;
#size-cells =3D &lt;0&gt;;
i2c-mux-idle-disconnect;  /* may use <a href=3D"https://lists.ozlabs.org/li=
stinfo/openbmc" target=3D"_blank">mux at 77</a> next. */

i2c_pcie2: <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" target=3D"=
_blank">i2c at 0</a> {
#address-cells =3D &lt;1&gt;;
#size-cells =3D &lt;0&gt;;
reg =3D &lt;0&gt;;</pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)=
">-----&gt;slot =3D &quot;PE2&quot;;&lt;-----</pre><pre style=3D"white-spac=
e:pre-wrap;color:rgb(0,0,0)"><pre style=3D"white-space:pre-wrap">};</pre>
i2c_pcie3: <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" target=3D"=
_blank">i2c at 1</a> {
#address-cells =3D &lt;1&gt;;
#size-cells =3D &lt;0&gt;;
reg =3D &lt;1&gt;;</pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)=
"><pre style=3D"white-space:pre-wrap">-----&gt;slot =3D &quot;PE2&quot;;&lt=
;-----</pre>};

}

Whenever the host sends the IPMI OEM command to get the I2C bus/PCIe slot
mapping info, the BMC can parse through all the i2c devices under /sys/bus/=
i2c/ and find all the i2c devices which have a property called slot under o=
f_node. The BMC firmware can then send the I2C bus number and the slot name=
 for all the i2c devices found above, as part of the IPMI command response.

Does anyone have any ideas/suggestions about this ?</pre></div>

--0000000000007df9a705754bf9db--
