Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JDhkFeZF"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wjvK0bBxzDr5J
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 18:10:20 +1000 (AEST)
Received: by mail-qt0-x230.google.com with SMTP id f1-v6so22163033qtj.6
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GfwXe+Yq7R7SFCnSk+QELsD3KRwCH2jD48KdHP+eBpg=;
 b=JDhkFeZFp8Q0vigYE2mhgNBZgG4PXNYYzkrJpHDl6VXuswYfpIspBt6wA3WEDhSq7C
 F/y6hKBXEmzqEq0NWFtLANk6dIA2a7MOqc//woexWJF/c6RMgKxnIdyfQxyoofqdgbeW
 MMNf99Ug0f2qfrlgK6BOg8LMjZLLz9hslB4VyvDAvly0LcCOQ1Ntts1QjLP2fWwuvPoo
 Ak6yB/3S8IS5Rwfl1Xzf5VkngvX8A0MIR/rmYMWcCtdjwtFtmXS5lGe1cJ+MQBta/3h2
 DZZQpAo4MG4QJ3levUQVPkJ39tc+XrHxqaLbLF6All4IrSp/s1FlWDY7bQHyXfV7q4Jj
 8Wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GfwXe+Yq7R7SFCnSk+QELsD3KRwCH2jD48KdHP+eBpg=;
 b=sm+pnNobi3IHyc3OZz++vgaR69+LYTY4/rKHIxgbienGw6ahNP0bGHU9kGcLNoKSPM
 2XYh7biK5TtWlAdDOtkizHkQzMassamsXu6dQmzmtJCQWeQ1oKnhYQy2CYfp9wz/T7Hs
 GUIc1mDSFsi2SGZHSyU/Fcy+C8W7Pq15dq1SaHJsNTNcKhjl4l5L0c320vxmpSiWxDh1
 NXIjyAY6qbC1i45bYS+x6uj6REaezniQERwgEwGSkMlhUo65PvpGN8VlSaZo3jUy5B2b
 r4txyoNW9C+Np47y+ZZ4ijkm7EL7LD3LWwxxnaOQGwJl1r7csKDRIICLt5WyD8SYgyPU
 loUA==
X-Gm-Message-State: APt69E2iFMNh2wi3fBOI2c4GoHVcJ7PepdMJz4/zJEx9ZyNKLvbvJktG
 dFu4qa7AYKvwg+N16Asm9W5lw+GJYyqFIaHRGUMIoQ==
X-Google-Smtp-Source: ADUXVKLX5Y5EMasSiuK1BorEYozYyTldOBKC/asbubBvoxXA6knG9dFmkt20ha4fiuPDURp2Ldtx9iZeDNtQ4kXmKfg=
X-Received: by 2002:a0c:87c1:: with SMTP id 1-v6mr1509776qvk.141.1527667817967; 
 Wed, 30 May 2018 01:10:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:7355:0:0:0:0:0 with HTTP; Wed, 30 May 2018 01:10:17
 -0700 (PDT)
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 30 May 2018 16:10:17 +0800
Message-ID: <CAG9c7cB8S=VL6g2Z6dXmC55P-3CW+p+wURH=Qgy-sZXL6b9deA@mail.gmail.com>
Subject: Unable to find mtd partition for image-bmc
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009ff39f056d67e176"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 08:10:21 -0000

--0000000000009ff39f056d67e176
Content-Type: text/plain; charset="UTF-8"

Hi,
I followed the instructions described in the the below doc to update
OpenBMC FW via REST.

https://github.com/openbmc/docs/blob/master/code-update/code-update.md

And I got the below error message.

{
  "data": "Verify error: update: --no-flash --ignore-mount --no-save-files
--no-restore-files --no-clean-saved-files\nERROR: Unable to find mtd
partition for image-bmc.\n\n",
  "message": "200 OK",
  "status": "ok"
}

Does anyone have the suggestion?

Thanks.

--0000000000009ff39f056d67e176
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I followed the instructions described i=
n the the below doc to update OpenBMC FW via REST.=C2=A0</div><div><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline"><br></span></div><div>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline"><a href=3D"https://github.com/openbmc/docs/blob/m=
aster/code-update/code-update.md">https://github.com/openbmc/docs/blob/mast=
er/code-update/code-update.md</a></span>

<br></div><div><br></div><div>And I got the below error message.</div><div>=
<br></div><div>{</div><div>=C2=A0 &quot;data&quot;: &quot;Verify error: upd=
ate: --no-flash --ignore-mount --no-save-files --no-restore-files --no-clea=
n-saved-files\nERROR: Unable to find mtd partition for image-bmc.\n\n&quot;=
,</div><div>=C2=A0 &quot;message&quot;: &quot;200 OK&quot;,</div><div>=C2=
=A0 &quot;status&quot;: &quot;ok&quot;</div><div>}</div><div><br></div><div=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">Does anyone have the suggestion?</span>

<br></div><div><br></div><div>Thanks.</div></div>

--0000000000009ff39f056d67e176--
