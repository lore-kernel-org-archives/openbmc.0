Return-Path: <SRS0=/yhw=E2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570B6C5519F
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2020 05:58:43 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6368922256
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2020 05:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="rnadXbX6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6368922256
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ccm7g0CbNzDqY5
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2020 16:58:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rnadXbX6; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccm5l25ZhzDqdS
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 16:56:54 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id u19so11791892lfr.7
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 21:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgM6yrsOYHJbBurdKGkHMP6wD0m+SDWcc+1vtYEnt84=;
 b=rnadXbX6gW95Mv3hNnqPvsJcoIzWL5syV9UEXFItpfsKS6O/4jqfEFjpGtsS1T1f2P
 q8LPAq4sRK3w5TeOhMd7Z284/c2l++C/VrBwNdT7iH3EDrGiP8mNgcWrexXHHhx7wG0S
 +BsQJMWFuim+Qfd4xjzf5WZpFEQQQAUdTAmfaJO8w1xnxw1BBT27ffAd0anPSoM7iINM
 8heIuLgIwKjD9gh9B6Prlm4ErE1t256G+7PskhfuStdf+l/rmm/2K5SxyfyfqEtlXyRV
 aaQnKk6jghYunp6eCvDgz2ByepcBoNW0WRmIsAY+8hZM0FUS+KgsGLGalRXqaIcAZodw
 ZHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgM6yrsOYHJbBurdKGkHMP6wD0m+SDWcc+1vtYEnt84=;
 b=kmBxwK5Zs81Qsp4yb5feYIxdWu5JUGC5yNqMBfhQ3JO+jtajo7yxlkdcnTa3+cdc8q
 oOTBShFKuPlUFfJIKDoqKjOxzibddmC0uRmSaTnwUyLg5p+ibotuD+bfd+bh7nT5jvaF
 y3ijzBf5O17/kPZw5NynyMtLUSCtMw+AgXtIHx4JWXw1renPIEnH2cFCuwaL44eiHniv
 may7SKa0s/D406SXD2nY5bVOrVTK/FhyoZEZ46IiB+n3UuR6UDR72NfcQSo7pYRdH/wl
 kNnHI9U7hZ5tkU8iH4NbgFMdVBFm/G9SGz4Onfd08TFyVr2KQ5f2wGIEJ/ChTG4qrtBk
 M9Hw==
X-Gm-Message-State: AOAM533C2oB9+kBVUs9OHUxuWJqt/zz/G+6TDRJ4MzJL4jcBrGpf9Ko1
 0q+dhyQBBIDwtGE/PGLl/RlhiKNZJ59gTQh1Ab0stQ==
X-Google-Smtp-Source: ABdhPJygySvzbgEwVm3wKP6hWjTs+cbUfyDkwAJH4kG2qTXfNZheo04Y5dSRm02fprTJppowiFQGrmboykVgcGX9mWo=
X-Received: by 2002:a19:4915:: with SMTP id w21mr7322033lfa.57.1605851809768; 
 Thu, 19 Nov 2020 21:56:49 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR08MB588362D381EC3603682F9B32B2E20@DM6PR08MB5883.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB588362D381EC3603682F9B32B2E20@DM6PR08MB5883.namprd08.prod.outlook.com>
From: William Kennington <wak@google.com>
Date: Fri, 20 Nov 2020 00:56:38 -0500
Message-ID: <CAPnigKmZ1FHWXjbhG_XnrgmsYPpjXQhTLwM0cW=6Mf00iQatXQ@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash build error
To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
Content-Type: multipart/alternative; boundary="000000000000af87f005b4838225"
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
Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 XP Chen <Xiao-Peng.Chen@fii-na.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--000000000000af87f005b4838225
Content-Type: text/plain; charset="UTF-8"

If you are installing these manually, be sure to install
https://github.com/martinmoene/span-lite before building and installing
stdplus and phosphor-ipmi-flash.

>

--000000000000af87f005b4838225
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If you are installing these manually, be sure to inst=
all=C2=A0<a href=3D"https://github.com/martinmoene/span-lite">https://githu=
b.com/martinmoene/span-lite</a> before=C2=A0building and installing stdplus=
 and phosphor-ipmi-flash.</div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_=
-5300371022549447207WordSection1">
</div>
</div>

</blockquote></div></div>

--000000000000af87f005b4838225--
