Return-Path: <jaghu@google.com>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com
 [IPv6:2a00:1450:400c:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCxmF1G2XzDt2M
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 04:55:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cfUb9LkP"; 
 dkim-atps=neutral
Received: by mail-wm0-x22c.google.com with SMTP id f82so196416309wmf.1
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=rHEit1k9zl1lhIdNVqVY/ZhJ27Ei85xy4BtmKllqPpY=;
 b=cfUb9LkPU6SidX3LYDUSOV2dQgrAe9zn1cmnN519Ob4EIKMyBtJqyvPREVFmTBGKn0
 XcaC0s8ZLpg1SO6w1AgD5QlHx+x08Crrp5QBLnUXtIpEHt9pr9BVNiar7W5/BS0dT0Km
 aQTaEc/cBOqJTEaihWp3kL10PK7OfwzarfW3aPE7WBgvbz5Ty7KP0OUMioWogwiN/3+v
 e+cBg+Cqz5UNMUxkaH9pxPIJSBRN6ih550J4iEq5HiaCe5KYP9/izaYVAQQKt3zZ1bGb
 7OMlK+Ckh5NF1BloPHLEaUKU2Yk1CAfE5c3Edgp2DxKbO0QBpb+La7k/A3JtKxMQH3E2
 0RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rHEit1k9zl1lhIdNVqVY/ZhJ27Ei85xy4BtmKllqPpY=;
 b=UPIF6tv8Oz/tVhc1Dr8mjsSIyVSSGS4SwAIISWE5xucRoVgjU7fD1bkDMey+PiABBV
 pfjP/T4nuwKAIJaok1mt+QJQ5APVmFinXPkTA4lLIjDMFod+CoEiuLQh/tm012f/renY
 WCUfAjcWReCbtWchAbqjAEOA/lazU24ny5X5AbBF6P15qQbVT1xZyr41SUwe2HzJVPND
 AMiWL2anabN2FVCM25MzwSQOpHbDeH7Lc6/yd7fRYsOwr/UbLSBhXXXIxBHGOL0pVAxC
 2b6qJ3ordlocnLY19YjsRGPt7rlL+ATauBGqL4TAk7RHoD3Ii0sTnfxsMMQDrj18gYDk
 SHpA==
X-Gm-Message-State: ABUngvf+vOoYkmRoQRf6jxEmIkEFnOKuMP18YFP6qaKhOLHk7T/hGKYYxCml4w9fFlYxOhaadI/He1BfWnX6Zc0/
X-Received: by 10.28.1.135 with SMTP id 129mr17834607wmb.108.1478627705388;
 Tue, 08 Nov 2016 09:55:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.146.147 with HTTP; Tue, 8 Nov 2016 09:54:44 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Tue, 8 Nov 2016 09:54:44 -0800
Message-ID: <CANsWYUXcJ6zKwJ2R2maOJLHxMGjMCPELvFatW5F6nUNzf1Lf6A@mail.gmail.com>
Subject: Question regarding PWM types in AST2500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113c842e22e2b90540cdd7e2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Nov 2016 17:55:10 -0000

--001a113c842e22e2b90540cdd7e2
Content-Type: text/plain; charset=UTF-8

There are 3 types of PWM - type M, type N, type O given in aspeed

ast2500 datasheet(page 671). From this link I see that there are 3 types of

PWM : https://en.wikipedia.org/wiki/Pulse-width_modulation#Types

How to find which type is related to which definition? In the data sheet
they
have also given rising and falling bit. If the type is not fixed for a

particular definition, do we need to use these two bits to make the pwm
type
behave as per the wiki definition.

Thanks,
Jagha

--001a113c842e22e2b90540cdd7e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There are 3 types of PWM - type M, type N, type O giv=
en in aspeed =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><d=
iv>ast2500 datasheet(page 671). From this link I see that there are 3 types=
 of =C2=A0 =C2=A0=C2=A0</div><div>PWM : <a href=3D"https://en.wikipedia.org=
/wiki/Pulse-width_modulation#Types">https://en.wikipedia.org/wiki/Pulse-wid=
th_modulation#Types</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0</div><div>How to find which type is related to which definition? In =
the data sheet they =C2=A0=C2=A0</div><div>have also given rising and falli=
ng bit. If the type is not fixed for a =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</=
div><div>particular definition, do we need to use these two bits to make th=
e pwm type =C2=A0 =C2=A0</div><div>behave as per the wiki definition.</div>=
<div><br></div><div>Thanks,</div><div>Jagha</div></div>

--001a113c842e22e2b90540cdd7e2--
