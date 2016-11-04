Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9VZ56d6JzDvNn
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 05:22:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BhSHI9Ze"; 
 dkim-atps=neutral
Received: by mail-ua0-x233.google.com with SMTP id 12so73238611uas.2
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kNYfzITKzn1pyzZqpgBwuytd1/3nxnrcKjhBf9oK9qQ=;
 b=BhSHI9ZelZsJoBXbgGXC54t3pscQupjZBE2VxYqd5AaPJGFGDykOa/QL4P1ux3t0pM
 fPdFyV/AZFFAoQSG9TF8c04KKk9Gw/4IZVm38Vs2i4teJZjwoJUkKw07Tf3PiTiefq+4
 b3q1gSC5A1dZWS6I1w50Njpa4zsmNxOGJ7HOzhESSr/oAVQsCsllQUEv73HFPTHIw56i
 sJKvZZNseDexJtF9a6UK+VONhmnPvfJzWodYj7xWdlSPcEKBu9MA41LM1eL4it0guv3V
 GQxhU6Mf+fvzPw5F25fji1au13iNOjqKC5ZPD31iJb7BzHLrJ0sjIBP6D/9pCHge+EaN
 soDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kNYfzITKzn1pyzZqpgBwuytd1/3nxnrcKjhBf9oK9qQ=;
 b=TpqdscRNc9RKY+0Xx/kZ9AGzz6Ma3FIEO7xkZPu89nipRhelPHExDtDRv4yrcHIBcE
 n4FLJXeTpdEvsgbZNb+GU2gFKvattK+V9DkNGe2RGsvWw6jbeV6lWW4lzXhvDg2MlE14
 k3gVuDBn//oO0FZwi1NjMdsQl2Uvc0fqeiWfsEzCB/q8wmuNhknJwPDh+aBnspyGqFuP
 oZ8eam+ARzNxhNaxxvwbAK3p+t2lqTmsC77zQz0BZxap+auDIqmloOS05jq8boGRJZti
 C79z+jBxtcMg50vD2QUemQmCjGBiobgAF9VQD9CNFffpICgLGBico2ISPDIC1EzH/3+m
 0z6A==
X-Gm-Message-State: ABUngvdWs1ckbhbSjhbYX5ANCOsW18BCMf+mhtPPeyJow3lxEZGRLsRooVGzYIabWfJDEMp9/iRLdrP8ccjIYZv7
X-Received: by 10.176.16.2 with SMTP id f2mr10593049uab.49.1478283770634; Fri,
 04 Nov 2016 11:22:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.36 with HTTP; Fri, 4 Nov 2016 11:22:50 -0700 (PDT)
In-Reply-To: <c1423337-705b-5d24-4205-c9ce8c32f1f4@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com>
 <20161103182300.wt2lyseogigfxqfn@asimov>
 <53954820-3eaf-56c6-0a4c-9347ff4dc358@kaod.org>
 <20161104015543.GD17105@heinlein.lan>
 <c1423337-705b-5d24-4205-c9ce8c32f1f4@kaod.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 4 Nov 2016 11:22:50 -0700
Message-ID: <CAFd5g45PHWivKg17TRofahmtpZiTP8eWpBVrds=XB1EBh1t7QA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: Cyril Bur <cyrilbur@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=f403045e315806e63205407dc372
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
X-List-Received-Date: Fri, 04 Nov 2016 18:22:54 -0000

--f403045e315806e63205407dc372
Content-Type: text/plain; charset=UTF-8

Thanks for roping me in,

Patrick summed up my intention perfectly. IPMI messages will be structured
the same and use compatible fields, but would allow for different flow
control. In particular, the goal is to allow multiple requests and
responses under a single sequence number.

--f403045e315806e63205407dc372
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for roping me in,<div><br></div><div>Patrick summed=
 up my intention perfectly. IPMI messages will be structured the same and u=
se compatible fields, but would allow for different flow control. In partic=
ular, the goal is to allow multiple requests and responses under a single s=
equence number.</div></div>

--f403045e315806e63205407dc372--
