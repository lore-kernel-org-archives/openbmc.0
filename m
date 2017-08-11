Return-Path: <raltherr@google.com>
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com
 [IPv6:2a00:1450:400c:c0c::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT56h3pTXzDr2S
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 10:12:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gvdffQvH"; 
 dkim-atps=neutral
Received: by mail-wr0-x235.google.com with SMTP id y43so8252035wrd.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JLodl2IXh6URE3+Xmr77KeRoBCG5j7DEMyQstRAYawQ=;
 b=gvdffQvH3dkrpL2k1ubBSDn2GyAHxKGy+26O88M+5CZW9ovt6G9WwZIc2TvvN0naFF
 dCqmvFXD+EX3fWRVsxgI2l5tBFEvdBL28BlHV8hPc6roM/K+7JRjQRU4ZRmYBABk5Lr8
 RCXFJ+UVtqUDG2ssp+ShTNWegE8sm/HAuXTpGYisde0CESocFfijNZ1hPCS2xjKOdyEB
 vj+1oZehdtQ0IEWhfS5H906WmTHLrH6K+1FNr3r/hpiKUFSIJDzPxF5YwM22fHKpOj5c
 BNQ7Rx4V1EP+MNwyVDtGb9UY7upuCexcjvLKf/U333t2787z3Hu5YuvXovwU2z3MvIMS
 UvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JLodl2IXh6URE3+Xmr77KeRoBCG5j7DEMyQstRAYawQ=;
 b=TQ8B6ItNyexKYEz99Wbt243bPdXdG133EMZM3nG+Yt0NrvboV7kr2QWJz1xW7UiXFE
 Koawe8ienyjEuj3GSIF2v0LnY8Sb/Zu2s4PsLrZ4pY8TO6LHBD/G6A11VDXcuZlk4VuO
 HyiaYgqy07eF8MBPWtvbKEsvIp+c6kwxfX80hnWlj3TgrxC57JmFd2zYAxI2wb3AfwOk
 QZ1KcA4PdX2+Iicx3GhXbcGMQDlBb2MNBNrW0whWnBDW3Io6n/ipKtp8MSz1lo8QARSL
 6Atv+g88dme1I9SEjh/JwQ4LSkFMI3Ys5fIzv2irCICwB/QIa76zEU82Rn8/e/FWv8Rx
 vQ+g==
X-Gm-Message-State: AHYfb5gHuMEo7raYiiLuPfsUIwSVMNxhEkTPyvWAKFBDuuwikdGmqH96
 pzuGPZnOMIDkj7IrQkgxVnUlD9aIHWfL
X-Received: by 10.223.154.105 with SMTP id z96mr9089859wrb.73.1502410345360;
 Thu, 10 Aug 2017 17:12:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Thu, 10 Aug 2017 17:12:24 -0700 (PDT)
Received: by 10.28.153.69 with HTTP; Thu, 10 Aug 2017 17:12:24 -0700 (PDT)
In-Reply-To: <CALFfRJMyenqRKq=xfhWW2O1UkQE12Xg+n_+4+Cq9HOb5zBbkpw@mail.gmail.com>
References: <CALFfRJMyenqRKq=xfhWW2O1UkQE12Xg+n_+4+Cq9HOb5zBbkpw@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 10 Aug 2017 17:12:24 -0700
Message-ID: <CAPLgG=kdZt+6Nj0pbME0fAoo2YkdOU1O-W0qdpuQc3-PV0LBrQ@mail.gmail.com>
Subject: Re: Regarding SOL application in openBMC
To: sachin naik <sacnaik@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f403045f5048f17bbb05566f2ad8"
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
X-List-Received-Date: Fri, 11 Aug 2017 00:12:29 -0000

--f403045f5048f17bbb05566f2ad8
Content-Type: text/plain; charset="UTF-8"

I'm not aware of it being implemented. Virtual UART is enabled and
accessible via obmc-console-client. Certainly reasonable to add SOL.
Patches welcome.

On Aug 10, 2017 4:39 PM, "sachin naik" <sacnaik@gmail.com> wrote:

> Hi All
>
> Can anybody know how do I enable SOL functionality in openBMC?
> I am using aspeed 2500 eval board.
>
> Thanks and regards
> Sachin
>

--f403045f5048f17bbb05566f2ad8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I&#39;m not aware of it being implemented. Virtual UART i=
s enabled and accessible via obmc-console-client. Certainly reasonable to a=
dd SOL. Patches welcome.</div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Aug 10, 2017 4:39 PM, &quot;sachin naik&quot; &lt;<a href=
=3D"mailto:sacnaik@gmail.com">sacnaik@gmail.com</a>&gt; wrote:<br type=3D"a=
ttribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi All<div><br>=
</div><div>Can anybody know how do I enable SOL functionality in openBMC?</=
div><div>I am using aspeed 2500 eval board.</div><div><br></div><div>Thanks=
 and regards</div><div>Sachin</div></div>
</blockquote></div></div>

--f403045f5048f17bbb05566f2ad8--
