Return-Path: <openbmc+bounces-2024-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4A9CD6E57
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:46:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSCG5F1rz2yS4;
	Wed, 03 Jun 2026 09:46:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1332" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780385062;
	cv=pass; b=OvR74/Mybb50ehBylJl5KSJTPkuUOYksma4FoGHo454lOJ7Jf8TQGX1gATEJ+0AgmaFXS5N9pivf0d37bt+8Zr6Zxv+pDSfMTRLsszTpOmFo9lt/fc9xxFNBF9nhk5nDV12RIu4TAcIqbLuIvZG56RLjBuy39VIHBZlOPAaLr8x4mb/54aoeVzSqmM5QzqjarvJzMWuGlEOlyXnTJ8dwB8tSf6BrXVL0XEpflmaX9dUrObxcdI2K3b2Vs7q+0+k6KgGTpGJCYTwEBP2XLybSZjbTu+OzIkl/5eRUJYtoo5twNsFumypnohpkHmRmkohw1WOngWrFBVAbQUyp9FrFbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780385062; c=relaxed/relaxed;
	bh=WSPmU9u1nCkYGVCVW2CIv/l3Ij7X/SRzvT4X95GUycY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LWNp1+hkzf1TFYXIK5Qiq8TWVnqkF/JDGiXOCFN40plTCpPwPGiSCZqzpUODjZ8OJlXjTuQ+bnLjm+0TQle5HE//5I+P7kIQxVWPW24tEzAsn1wEP8KRqg2auPSZ3LjXR0Wjrw/aqMNGNzrIk9ePl7d0XoObcqtHVJjGcimVeXC2rLGsjFaeXFUPcKy7/ZjhBoFKLfOZBGFInZJMl2QqrJZrMM0lzK59/LSS6vJB2iuU9l/a3rAC1Y/KmAz8aZ3mwDX7G+ImYZouzeBObJLc0ahyeW1+QKLRS7/JZ/q31HOC0z2tDnntjf8eR0JN3NcuOjlAi81hAL0tX6yKVD7SdQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rT2iKsde; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com; envelope-from=rio.chen.hj.wiwynn@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rT2iKsde;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com; envelope-from=rio.chen.hj.wiwynn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1332.google.com (mail-dy1-x1332.google.com [IPv6:2607:f8b0:4864:20::1332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gV2QF62LDz2yb9
	for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 17:24:21 +1000 (AEST)
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-307263ad0cbso1961279eec.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 00:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780385059; cv=none;
        d=google.com; s=arc-20240605;
        b=b00U/TMX9/J9K+RehP1VkDb0jS0FByF/sFyLTjxNv6G3Aai43U9yKMCjFnXuDKYn2G
         u3oI8ZWmDJnsdZGVsl8lPCoQsJrqEvr0cASDOJgWq4e6UB0fOtx2mc10uSM0aL11KFoy
         gSZgHY+EC2sw3QRuspIelyWk/I2zmTR767c6EDohv4ND2GNxKCatZ4Zu28WB/uU/wE5v
         BEYdkOuhAUoeWKWffKaGGsuuk1BTzpJ24vzNQLDQfGXcOoOeXX4SaNwiPxxbtN/cENiW
         KgNZscu/GWwxISlUzC+zzgniuSmL3sW3hPgrto8WzfLG+5GoA6yAPuwmOgrJDM2pcLi0
         WFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WSPmU9u1nCkYGVCVW2CIv/l3Ij7X/SRzvT4X95GUycY=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=LLMWn071hGAj1MjIcDQod3U+TTeQ54nU1QhIdpNQ9p+BkXooyT7BLkBpy36F2nVQY6
         pfAAVmd9CU/aq4gIQ5SoLU7POQQrEz8AZieCl+SHy41f+CTlHwrpzfAhBTfX9vQcEiWs
         EklIF2sVUHkqzm4+KCptAfCReXg2+xH9FZBTe1jz083jURapRHVCjGIHA7t37LjkvsiK
         1MLrDRUldy9ZESIMUSr6oBuiA4QAxSBXTTWL0Um1d9V1kcUMVRvG0sqQpWOousro+iDq
         shYzCVwwUiYQF6HssIEZl9UbuUaXtznkX+YhjgkAoIikSqz2Nk53LSn4Gk0mDf81hBIz
         yWhQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780385059; x=1780989859; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WSPmU9u1nCkYGVCVW2CIv/l3Ij7X/SRzvT4X95GUycY=;
        b=rT2iKsdeQQ0qUW10Ox2VXJdeFowPlW5Qo5Ov/WXlFFjbMmsYFpV0LNMnzELeS4M/y/
         GyOt3Sl9PrucHAmO8O/8/tb1rMKIaO6cJCI2kfhws85GEB6jm87tILzDj7U5cX5zm3+V
         K7QKuhA4hpXZs5OETMBCeWfT+PlcPHtegu22NcVU7jyj/QSPp6urKmBESw3pCkRskXBi
         6Ai0QF3oQQ51PS35jURfjo0gqiV0T+ikU9sD23Ut3M2y4mnCruGr6sPrRXuLr+w9g5Ie
         8ndVcSL/1dqY7N/5m1/pmvG1Fbr92mFeo6N9UKeZTbXOFUv/rptB5XdfFpkmSpuaKoJU
         vyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385059; x=1780989859;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSPmU9u1nCkYGVCVW2CIv/l3Ij7X/SRzvT4X95GUycY=;
        b=MiGFRlAXXVeXAFLH/FxyZk3tesNAcpJbEpo7A77iV7UoahA8r8Z3nB/jJw036oyd7D
         q0KSm4X00jgrwAHlh6qPQolmFj9s+V5VJJuNCCbbdIjDKP+Jam5C/gPoehwO/5PDKXuc
         udfPpfD1fTe083E6KNYgWSthatxxAuBHzhU1rMLh7DxAALMqFpYIDtkfrRlp8BdhkZh3
         7knlmlgUZrew4W70KzfQjy8daIfZ/cgJyw2g6MZ/+vOzOGUms2ct+GPUa0rIzobZ162g
         rmoIlUEPn/2wzSFiy1YxwNhgQH2VPtXC9lxkv0s+CBeef+zTA4/H2Vt8We12bBZFOV+U
         cHPA==
X-Gm-Message-State: AOJu0YxjQVb5jn2RH1UHdn7y/xjvScmC6vVDp/jeub6M/bskAWX/iUiQ
	gNsGzklVEmct/67Gwms9SR7PGMUJ6EtLsEJwSRWXIgs3rNpcZlR+0ZEvAK55MZIPPHmVPgg/BhY
	93sE0yOuyfp/hkuPDdsEFgyzKrvfBR2ojfezA
X-Gm-Gg: Acq92OGm1y0iPviLusQrMoqTo8qIbR8P+GtDcklmIepSxboHw7pix1yWvrgFSvjBUg/
	1tYX1yHO1eceItx2y7CPkw2Cli/v6dKZNx4XgdEs2waHJhMs7LVQCv7ozCWgXT6RRO4+sV3+mk3
	iAPowN+2/B0sGCIbesP7Z54T6hK0RiD1BCv3EPKFvMX/75ZcJuLUpDVPow3fh3wJQqs0WoO0zk9
	qMU1NTMCPp9qnwgWCrQs8o01GDGIe8K2k7BflgJ0F/hfUQgvzp/wKc5z6AYfK9Z7u45bdR4BM69
	Se35PmMSeX3TK/mvi7B1QC4XNlmJog==
X-Received: by 2002:a05:693c:2c86:b0:2f3:5266:fdfc with SMTP id
 5a478bee46e88-304fa6a6ff7mr6278310eec.33.1780385059395; Tue, 02 Jun 2026
 00:24:19 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: rio chen <rio.chen.hj.wiwynn@gmail.com>
Date: Tue, 2 Jun 2026 15:24:07 +0800
X-Gm-Features: AVHnY4I258p2jldpd1I1oJSSZaYqe1o7nUIYAgtseZbiBuc0fQFhUcIBU2XWTA4
Message-ID: <CAHLYVqdjJOecp7eRJDhXDv9K27c6cCE52YzWsJyzWm=5czV8Wg@mail.gmail.com>
Subject: Gerrit Account Issue: Email locked after changing GitHub username
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000075b74065340332a"

--000000000000075b74065340332a
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Admins,

I ran into a duplicated account issue on gerrit.openbmc.org during my
onboarding process.

I recently changed my GitHub username. However, before that change, I had
already initiated the Gerrit account registration with my email:
rio.chen.hj.wiwynn@gmail.com

Now, when I log into Gerrit with my updated GitHub account, it seems to
have created a new blank profile, and I cannot verify my email because it
says "Email already in use" (locked in the previous ghost profile).

Could you please help clear or unbind my email from the old profile so I
can link it to my current GitHub account?

- Current GitHub Username: RioChenHJ
- Email to be unbinded/verified:  rio.chen.hj.wiwynn@gmail.com

Thank you for your help!

--000000000000075b74065340332a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Admins,<br><br>I ran into a duplicated account =
issue on <a href=3D"http://gerrit.openbmc.org">gerrit.openbmc.org</a> durin=
g my onboarding process. <br><br>I recently changed my GitHub username. How=
ever, before that change, I had already initiated the Gerrit account regist=
ration with my email:=C2=A0

<span style=3D"color:rgb(31,31,31);font-family:&quot;Google Sans&quot;,Robo=
to;font-size:14px;text-align:center;background-color:rgb(233,238,246)"><a h=
ref=3D"mailto:rio.chen.hj.wiwynn@gmail.com">rio.chen.hj.wiwynn@gmail.com</a=
></span><br><br>Now, when I log into Gerrit with my updated GitHub account,=
 it seems to have created a new blank profile, and I cannot verify my email=
 because it says &quot;Email already in use&quot; (locked in the previous g=
host profile).<br><br>Could you please help clear or unbind my email from t=
he old profile so I can link it to my current GitHub account?<br><br>- Curr=
ent GitHub Username:=C2=A0<span style=3D"color:rgb(33,33,33);font-family:Ro=
boto,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,=
sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;S=
egoe UI Symbol&quot;,Roboto,Arial,sans-serif;font-size:14px;background-colo=
r:rgb(241,243,244)">RioChenHJ</span><br>- Email to be unbinded/verified:=C2=
=A0

<span style=3D"color:rgb(31,31,31);font-family:&quot;Google Sans&quot;,Robo=
to;font-size:14px;text-align:center;background-color:rgb(233,238,246)"><a h=
ref=3D"mailto:rio.chen.hj.wiwynn@gmail.com">rio.chen.hj.wiwynn@gmail.com</a=
></span><br><br>Thank you for your help!</div>

--000000000000075b74065340332a--

