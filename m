Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fdo0Dpmz"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xxnj1c7FzDqKP
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 02:57:59 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id l203so7043222oia.3
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=azxyBG+7tZ6bYXmh2YEZYX83icN8AHrB4tlLdGGbchA=;
 b=fdo0Dpmz6yDVO/rTVSbSoLRpzYwqRFonHfjmIGeMUYpFHpvb8WqA14avfLnppK3daC
 rSoNkKnC35LJfG6hJbUztz0096yYxGGBlPy0HBBypXU1z3ir760wbB0zeLfwTFValt3n
 wKN8XrZDE7v9o1wHIDZDBArELK7gm3ufHwb9EG0FIQrZ9H6b7pDF5NHWkm24pt3U1Uy7
 5VyIpoiiYrmZM+/WA3MLYAK8XNuk8U6YdevAJQQGSxgSP4WXL8dAVjBTqvcy/7kcGzaq
 ssmXmVN058+BsJN76ci/FwjDscBpZ3GSHmfz1NO8PmRuq2UIYzCHSZJ8c+8g96ckcdXU
 dPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=azxyBG+7tZ6bYXmh2YEZYX83icN8AHrB4tlLdGGbchA=;
 b=uQ/AKMWr9MJdbpGHL2lvthlddJ6HHKurGM62Qba8fLkxncbgX+a6HUFGPsxgOXTop5
 ivsDy5+T07tnqzQhUzOZTIAEvRdfxDxJBqGPTyAEn2EivtDTDjrwudfeMoBwXSTVNq7r
 Iy0HL/E0g91qmavXRkObV4Opewu30VfsfUP/vhSpoRfpRY2oeZeig7AIuXZ32bV358H8
 etI0jStpyXOg3lAzYulY4mRR12GwS0DuITmkGsIIpNXlMxv6ynm6ft4GA0tnuqvOMF10
 ZpwzbQRZC6Eno5xhexQGyUr5t5YyOxrJet/xdOIKEknqlknPkhyuJwidu3oU/+5UBp+Y
 Bo8w==
X-Gm-Message-State: APjAAAWUIV96bmE9B0J5jtYad5QVAko+AvkXFy+5V3nl1TLf68vq/8UB
 wLyienQeh288wRQderV4y8wkD3rSqQ6ioEUo2xWONklnpjk=
X-Google-Smtp-Source: APXvYqytaBPjoVYB8nATUzwwNvO7ghSa3PG2fG2kYJ1ByKF8E767MzGr3dYZyJU3PgXZqbMl3ZkpOmmExKu/hsFdGJQ=
X-Received: by 2002:aca:310a:: with SMTP id x10mr9067805oix.161.1554134275654; 
 Mon, 01 Apr 2019 08:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <1c72193eaccf493d9192b831a21be539@quantatw.com>
In-Reply-To: <1c72193eaccf493d9192b831a21be539@quantatw.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 1 Apr 2019 10:57:39 -0500
Message-ID: <CALLMt=osTywPibRfe=UyqNxJS0AacOKpYbSCEvwH-iescee7VA@mail.gmail.com>
Subject: Re: I have no Jenkis build after pushing code to Gerrit
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Cc: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>, 
 "OpenBMC Maillist (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 01 Apr 2019 15:58:01 -0000

On Mon, Apr 1, 2019 at 2:16 AM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> Dear Brad,
>
> I have no Jenkis build after pushing code to Gerrit. It responsed =E2=80=
=9CUser not approved, see admin, no CI=E2=80=9D
> Is there the configuration I missed or it necessary to add the permission=
 ?

Hi George, looks like Brad got you added to the needed group in gerrit
https://gerrit.openbmc-project.xyz/admin/groups/8,members

I confirmed your ID is now approved for CI in
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/19705

>
> Thanks.
>
>
>
> Best Regard
> George Hung
>
> Research Division - Software Engineer
> Cloud Computing Business Unit
> Quanta Computer Inc.
>
> Ext: 16830
> E-Mail : George.Hung@QuantaTW.com
>
>
