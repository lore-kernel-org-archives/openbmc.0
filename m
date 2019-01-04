Return-Path: <omkar.kuppa@sanmina.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sanmina.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=omkar.kuppa@sanmina.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=sanmina.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sanmina.com header.i=@sanmina.com header.b="hW2AmTHs"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43WNWv4vPbzDqHX
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 22:55:19 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id c123so18232887pfb.0
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jan 2019 03:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sanmina.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=yGcI5Kq4UaPvLggjt6q9+hWnwvv3GwdR0eM81Wlov5Q=;
 b=hW2AmTHsawboNhH43XQRJksg54F8HNJhl+nJ455MmyJg5arVmfOWvZNghYnW+KPf12
 yImwrXgoAIJs/dY4FW8EPHMdmjEzlvX0wSujHDlqY34g1O6+VRk3wWiYxFq0KK4tYxyX
 klcz4om9v53ZGoTLjma2FVb3LvLGS8HoUcIho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yGcI5Kq4UaPvLggjt6q9+hWnwvv3GwdR0eM81Wlov5Q=;
 b=dibiBFMC1wfk96AxDEY6L+EQvOHoc2DXxBRQva6qVwC3OwKGNcaZ7g5VyajE79YL0S
 mdeMBzlWZN7NtbwAE2rZJ1JIktZR1OQvmI1ekt7/Q3Q9ttXNcZWaym6x5XZzkg2tv3re
 dHmqjMX1lvRGmQ8icf7saUFMHGZssBi4VG/OEVZ0dl9muIZzveLJiDM9D5yDif4Tco1w
 aXtr6Ucs8GcYk9fNYhbQhEljyBknsWrsrjfzvd/sGJAP+ob898zSyx0mgpH/qpJwTkHj
 7IO+/nslzk8CeGk7pnp69cNNR8z/dLg3+0zqLnbaQ836boB+MaCtSo+tc0lCPejw9bzE
 4zBA==
X-Gm-Message-State: AA+aEWZ+ARPBzC+YK957vsG8RCiOLnZbsYXsx8TIe1C+/peXOYc8xlUU
 L0lU3HcVmHuaMyOYoFkwNPOpyxncoFme4S7Nc/7m2Gu8K6jlMiaj0nIGdMb1aIOn7LotM4icW7b
 xwbrW08Go4iUxso8IJ3n2GmHtezqSjZ4LTFs=
X-Google-Smtp-Source: AFSGD/U9XSim0SYUJujEb132ZpYln54rYEzU+ohWud3MSQAQCglPRFc/pd6PuKbmhLtEmR0oZ14CuIHAmlm+9fYJhhg=
X-Received: by 2002:a62:2606:: with SMTP id m6mr50964244pfm.133.1546602916372; 
 Fri, 04 Jan 2019 03:55:16 -0800 (PST)
MIME-Version: 1.0
From: Omkar Kuppa <omkar.kuppa@sanmina.com>
Date: Fri, 4 Jan 2019 17:25:04 +0530
Message-ID: <CAOSNvHqX_Yt0hAeUKq=E1h2cr06QLZaLv4NeZRkfiXV4wQf29w@mail.gmail.com>
Subject: Error in running SDK
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000709438057ea08d94"
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
X-List-Received-Date: Fri, 04 Jan 2019 11:55:25 -0000

--000000000000709438057ea08d94
Content-Type: text/plain; charset="UTF-8"

Hi all,
I'm trying to setup Development Environment
<https://github.com/openbmc/docs/blob/master/development/dev-environment.md>
for
openbmc. I'm using linux (ubuntu 18.04) in virtual box for the setup. When
I ran SDK installer ( oecore-x86_64-armv6-toolchain-nodistro.0.sh) the
following error is displayed.
"*Error: Incompatible SDK installer! Your host is armv6l and this SDK was
built for x86_64 hosts*"
Please suggest how to resolve this error.

Thanks in advance,
Omkar

-- 
CONFIDENTIALITY
This e-mail message and any attachments thereto, is 
intended only for use by the addressee(s) named herein and may contain 
legally privileged and/or confidential information. If you are not the 
intended recipient of this e-mail message, you are hereby notified that any 
dissemination, distribution or copying of this e-mail message, and any 
attachments thereto, is strictly prohibited.  If you have received this 
e-mail message in error, please immediately notify the sender and 
permanently delete the original and any copies of this email and any prints 
thereof.
ABSENT AN EXPRESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS 
E-MAIL IS NOT INTENDED AS A SUBSTITUTE FOR A WRITING.  Notwithstanding the 
Uniform Electronic Transactions Act or the applicability of any other law 
of similar substance and effect, absent an express statement to the 
contrary hereinabove, this e-mail message its contents, and any attachments 
hereto are not intended to represent an offer or acceptance to enter into a 
contract and are not otherwise intended to bind the sender, Sanmina 
Corporation (or any of its subsidiaries), or any other person or entity.

--000000000000709438057ea08d94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi all,</div><div>I&#39;m trying to =
setup=C2=A0<a href=3D"https://github.com/openbmc/docs/blob/master/developme=
nt/dev-environment.md" style=3D"box-sizing:border-box;color:rgb(3,102,214);=
text-decoration-line:none;font-family:-apple-system,BlinkMacSystemFont,&quo=
t;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:16px">Devel=
opment Environment</a>=C2=A0for openbmc. I&#39;m using linux (ubuntu 18.04)=
 in virtual box for the setup. When I ran SDK installer (=C2=A0<span style=
=3D"background-color:initial;font-family:SFMono-Regular,Consolas,&quot;Libe=
ration Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-size:13.=
6px"><a href=3D"http://oecore-x86_64-armv6-toolchain-nodistro.0.sh">oecore-=
x86_64-armv6-toolchain-nodistro.0.sh</a></span>) the following error is dis=
played.</div><div>&quot;<b>Error: Incompatible SDK installer! Your host is =
armv6l and this SDK was built for x86_64 hosts</b>&quot;</div><div>Please s=
uggest how to resolve this error.</div><div><br></div><div>Thanks in advanc=
e,</div><div>Omkar</div><div><br></div></div></div>

<br>
CONFIDENTIALITY<br>This e-mail message and any attachments thereto, is inte=
nded only for use by the addressee(s) named herein and may contain legally =
privileged and/or confidential information. If you are not the intended rec=
ipient of this e-mail message, you are hereby notified that any disseminati=
on, distribution or copying of this e-mail message, and any attachments the=
reto, is strictly prohibited.  If you have received this e-mail message in =
error, please immediately notify the sender and permanently delete the orig=
inal and any copies of this email and any prints thereof.<br>ABSENT AN EXPR=
ESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS E-MAIL IS NOT INTENDED AS A=
 SUBSTITUTE FOR A WRITING.  Notwithstanding the Uniform Electronic Transact=
ions Act or the applicability of any other law of similar substance and eff=
ect, absent an express statement to the contrary hereinabove, this e-mail m=
essage its contents, and any attachments hereto are not intended to represe=
nt an offer or acceptance to enter into a contract and are not otherwise in=
tended to bind the sender, Sanmina Corporation (or any of its subsidiaries)=
, or any other person or entity.<br>
--000000000000709438057ea08d94--
