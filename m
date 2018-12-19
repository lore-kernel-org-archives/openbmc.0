Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kYSRrstf"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KJ310YgPzDqZS
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 12:58:52 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id w21so22122ioc.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 17:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/xzQ2IISlqsXwB/Vb6ZY1NpsNAQ8KTtAOOPTSmdA5iU=;
 b=kYSRrstfl8PZ3TJLBQRpfCCsWkepIPlYyuAkW59C4c7zGvvKn1ZTQiAkAqo5ob4Ccg
 ZUa8ahgRdGZQPMW3/YP7CSgl35iFUslLV2lExnLGp6xq73A3UNpRQIi74iCUW/DJdfr9
 YjKoxWIErc4n4B9AXwFoSxqqG7bE+HJKYVp3C5j3zsqVUObinyHvJ5uEWY47CXeN/Lln
 ji7kqDOjh0/7xhlhMzZerVlzQUi1Dbv+vUx2Cx8UThpm2jYJEGMhUoSWRB7+jtbaCR3T
 LfdRKYjbxjDBf9/GA5d5Mhrwkyg+/ikQ2DxUJsF8b72joQ6+WI99aKfcwPgZIHlwKhRU
 3QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/xzQ2IISlqsXwB/Vb6ZY1NpsNAQ8KTtAOOPTSmdA5iU=;
 b=cu8D4lffTqK1niHtdcYN8szokclV8QFeSQwX8vCFfntjmGnVJcYaI933qpEDV8W/N2
 vz52q2M566Fl65oGXsRKdX/jEbQHXb4/sJRYLME9aWQJBxhOxGNQlTKfSCOLWR4iiPqx
 bZnga9wLhijBXOm2F0BBL+C0gS9FsJqA+d0k3Tukpe2gCOsgw5CQpUNl69SgbIRjFW86
 9DwwrxxOJwnlNRMFA1nd6Kc60tQVGVQPD/uW9qOL6wka2kBfvYB+eoeRIDPJpuk4pdTo
 TrqhxM4VqWd0WaWEJ4LhDpJzmyvrNIy0bXij8e6PUVO44fG7P0KMf6DrP/Ozxr6kSb6n
 LkTQ==
X-Gm-Message-State: AA+aEWZfQeTA4M3ldBk3RRwQQXl/3O1vxDnQLzP5wQUuGg6dQrfXwWi7
 8Enm6GWm0TyTyqXFLwbg0KgZCquzxS7Oz7qrKJI=
X-Google-Smtp-Source: AFSGD/XHilNxpQI4LCdslrln8GgMfSc8YmXy81n/0juwxTqM2dIQASAWnyKnzqU5hL36MlPB9aze8ryef/oU2pFHCBg=
X-Received: by 2002:a6b:c815:: with SMTP id y21mr15267088iof.98.1545184728821; 
 Tue, 18 Dec 2018 17:58:48 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
In-Reply-To: <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 19 Dec 2018 09:58:35 +0800
Message-ID: <CAARXrtn23Loi2vaCoiOa-z_KZ8VQMPGjwS3TmX=hnMMfvvGc_g@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: ross.burton@intel.com
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, james.feist@linux.intel.com, 
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 19 Dec 2018 01:58:54 -0000

On Wed, Dec 19, 2018 at 9:07 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Wed, 19 Dec 2018 at 00:42, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> > I wonder if this is something they would be interested in upstream.  I=
=E2=80=99ve copied
> > the oe-core mailing list for possible comment.
>
> Thanks for forwarding this to us.  The class is very simple and just does=
:
>
> PACKAGECONFIG_CONFARGS +=3D " AR=3D${TARGET_PREFIX}gcc-ar \
> RANLIB=3D${TARGET_PREFIX}gcc-ranlib"

Oh I like it in a common class! We have "ugly" AC_SUBST for AR and RANLIB t=
o
gcc one in https://github.com/openbmc/phosphor-time-manager/blob/master/con=
figure.ac#L10-L11
Let's see how upstream think about this.
