Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BJcKAk7M"; 
 dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42dmz46KjvzDrYZ
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 17:37:20 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id c15-v6so3751953eds.4
 for <openbmc@lists.ozlabs.org>; Sun, 21 Oct 2018 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6dcito9/j3J00t6BLf2z3FCyZDYUFy/bFohHhrWyAJU=;
 b=BJcKAk7M+DgPoET/zQuW7r5I2eyC+g91luJK2krEs9kOBA/9LcW9JxS0BNDOUPciVi
 SVorxMbb8LqoMI3gK8gk3W1SkEBVei4akwtvjNjVukdd1VGPt/5MLObzPgPJy99IK2Oz
 xk+/zNfSnRNV+FWN7VBzB2vMLu4apeiKJz2Xtg+1MugFutSpYVKJlbX96JUhQ4JWfEze
 GF0sMETTiASoZp9BzsW9lucNJs9f0LTvGVmsJHdJUKiBB7IR7quCs0bpNZJvyoZNHTYi
 Ow1zNRC1mXQ28DxCSSbWvvnNEczxf2xX4wweESyLTHm/prEwR5J9HBNnKoQG7WqDisES
 e1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6dcito9/j3J00t6BLf2z3FCyZDYUFy/bFohHhrWyAJU=;
 b=eVPAihvwR8S8bI5RNyN/LyDWkrh3bArP6vrdWVmDJNvHMIuOMS4X804y4mfHgo1CAV
 nSa+w/MGKdYMMac/Pxn+nk1OoGP/nTgMi7Sxs9mHnuf0HjK0kGXG+97Fwy0ps8x7vTB1
 Q66fEUzL5QiMxbOAkuDISjkLMIe4siOGvqSCPsn+IEUXMeI9V2eVSSVJ/+npGvuXpsUb
 xkKdhLSV18YxN2KxHatD2Q3fv2z2t4U1ubm3VblbAIHBjckHWbZzebYCcbH6X9ZrDCFM
 kc7eat/UHCQK2HZfDtFejsC0frAx729G9uJqPGMojHalyihab3h5nFXB68aLuCKJArfG
 siqg==
X-Gm-Message-State: AGRZ1gIzUJ9fI7H7o2/fJlWjoavQezWKT6BvAfXmr5HtoANKzm5DqRfk
 VZ0K9GmAckBEb1PuAO70wwy1HFthlt4JLReR+Px0AiQ7
X-Google-Smtp-Source: AJdET5fm7KAYgoat+X6E0Myev0bil6LtIZyHknraP5rpsxPdlJq0BVa8r60hO60edOFrrcS3fNAxV3xqbZ6nWhpYc38=
X-Received: by 2002:a50:f53d:: with SMTP id
 t58-v6mr4538713edm.43.1540190237747; 
 Sun, 21 Oct 2018 23:37:17 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 22 Oct 2018 12:07:01 +0530
Message-ID: <CAE33tLHQWZBkVqNHHt1FFvatP4dxrSgJz39PO4Ogbqg1wdosGw@mail.gmail.com>
Subject: Read registers in AST-2500
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000001ecc40578cb7c32"
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
X-List-Received-Date: Mon, 22 Oct 2018 06:37:22 -0000

--00000000000001ecc40578cb7c32
Content-Type: text/plain; charset="UTF-8"

Hi all,

I used the following code to get the value of the control register 'SCU13C'
in BMC Aspeed AST-2500.

#include<stdio.h>

#define SCU13C_ADDR 0x1E6E213C
int main()
{
long reg;
reg=123;
reg = *(volatile long *)(SCU13C_ADDR);
printf("%li",reg);
return 1;
}

Running the code I am getting Segmentation Fault (Core Dumped). Please
someone help to resolve the issue.


Thanks and Regards,

Akash

--00000000000001ecc40578cb7c32
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><p>Hi all,<br></p><p>I used the following code to get the value of the control register  &#39;SCU13C&#39; in BMC Aspeed AST-2500.</p>
<p>#include&lt;stdio.h&gt;</p>
<p>#define SCU13C_ADDR 0x1E6E213C<br>
int main()<br>
{<br>
long reg;<br>
reg=123;<br>
reg = *(volatile long *)(SCU13C_ADDR);<br>
printf(&quot;%li&quot;,reg);<br>
return 1;<br>
}</p>
<p>Running the code I am getting Segmentation Fault (Core Dumped). Please someone help to resolve the issue.</p><p><br></p><p>Thanks and Regards,</p><p>Akash<br></p></div>

--00000000000001ecc40578cb7c32--
