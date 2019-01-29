Return-Path: <priyankarandive611@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=priyankarandive611@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VqfPfrpD"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pm5x1znMzDqPf
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 23:29:37 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id m19so16154206ioh.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 04:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AX0BOa7v8F1r1eKTt6mrM+rwptyLD4xqZ1CV4tHT1p8=;
 b=VqfPfrpD00ZSJURVRuIrXSueXQErU05KVAUSBfweUlZSw27QKjbiy1YFxazOxxWCYj
 Ov1N1jECeyfvKu5K1UuqX71F2wLwZRnRtRA7RlCGpWcHo87j4TIPdNQ4ZnSUdC5OjoZX
 REWpXvgPd/S5cOhiOsKyghQcMhIKuFe09SO6OTsZHX8OgzleYaLqGaMms3dZVVp16bUd
 UhvJKHu0MD6lfwHqE78UrDGZMLrCUMi+a0q4xfKUpiGL+E6enoh/yB5uOR7JKKOTUTxj
 RUP7BBzuL9CVL9N05zU6qXp8J+/bXLoCd1XAoszLsZO3b5HPhJ8g/yH41rKTBxIjmYsS
 Rykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AX0BOa7v8F1r1eKTt6mrM+rwptyLD4xqZ1CV4tHT1p8=;
 b=TTHIrYiSymgp7qfMI/DzrScF+h608zBx7dXwBI1B/pLa7Tox/IMAfnwQ4bFxvtCNHE
 v+G2GavPsaGZ7mcqucPcfDX/zvSDsLYZyiIT9dWn0StgYFbVrzbSNeblB8LHA5pcfnvM
 2sKRLTtoIQOBm6aT7re/fiB3mHG3l7NcOrKZzMTl//lVQRRGPGa2vwkfrDxUF3SF1QVD
 EFSRxE9EInjpxmjVpS11Mcjx52BtTyFywy77DDZQ6vVKNthEReCMIRrVOvj35LFLm4/9
 1/Wr0lTfkD9yaGxjPi6egXCZ6IZCDX42yrNq9M9/XHNBxACQyRQgddpaihu5xx0aQ7P4
 rxsw==
X-Gm-Message-State: AHQUAuZQengV2P2P1HGsK5AC3BzaxNR6/RRtdHIN06k/ezIADjVHdC58
 wX2pqy3HIXZ123lR0PoL3c7RLSVY8SXok2i9kTOj3f265O4=
X-Google-Smtp-Source: ALg8bN77/XHNUs1kcbWvBG0thfxVzHO5WzA4hMRlfdwDjamjNKKKTwhuI0ArCHEBw6LX7v8S372V3BaWnvSx+SYShiI=
X-Received: by 2002:a6b:1604:: with SMTP id 4mr14258040iow.29.1548764975082;
 Tue, 29 Jan 2019 04:29:35 -0800 (PST)
MIME-Version: 1.0
From: priyanka randive <priyankarandive611@gmail.com>
Date: Tue, 29 Jan 2019 18:01:41 +0530
Message-ID: <CAGxojq779wj=y+docT9yQtqy6zuTsT1JyEwDSUDZsSgnL2Facg@mail.gmail.com>
Subject: To reduce size of openbmc rootfs
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002e2faa058097f26d"
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
X-List-Received-Date: Tue, 29 Jan 2019 12:29:43 -0000

--0000000000002e2faa058097f26d
Content-Type: text/plain; charset="UTF-8"

I am trying to reduce openbmc rootfs image which i want to flash on ast2500
board.My current image size is 14 mb and I want less than 14 mb. I am
unable to find proper documentation or steps to do this. so please can
anyone give me solution for this issue.

Thanks in advance.

--0000000000002e2faa058097f26d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(36,41,46);font-family:-apple=
-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Sym=
bol&quot;;font-size:14px">I am trying to reduce openbmc rootfs image which =
i want to flash on ast2500 board.My current image size is 14 mb and I want =
less than 14 mb. I am unable to find proper documentation or steps to do th=
is. so please can anyone give me solution for this issue.</span></div><div>=
<br style=3D"box-sizing:border-box;color:rgb(36,41,46);font-family:-apple-s=
ystem,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&q=
uot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbo=
l&quot;;font-size:14px"><span style=3D"color:rgb(36,41,46);font-family:-app=
le-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-seri=
f,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI S=
ymbol&quot;;font-size:14px">Thanks in advance.</span><span style=3D"color:r=
gb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&qu=
ot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI=
 Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px"><br></span></div><=
/div>

--0000000000002e2faa058097f26d--
