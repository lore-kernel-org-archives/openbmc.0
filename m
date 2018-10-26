Return-Path: <artemsen@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8Art7Ir"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hWw33rJCzF3H7
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 04:59:14 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id d80-v6so1257301iof.1
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vGlAkEH2/PPSKi05hBKHIz6ip5pJ7iqA8snNo+QhlWI=;
 b=h8Art7Irv2kDHLhZQ9wD9zcU2cMW73T4f0Jrel7QFZpymFcT6W8eb6F7S3EtkAU+rR
 DHj1Q6jrymX3y3iB4Yn1s0t7eZrcxi05iYh9uS9iUBO2gq4BPHua9N2xVgPfg/baxVJC
 qTsPEvTDTkUC1mpIsGBTBJDJsebKm7DhR73uuRiDoHAdxi3mSRW+wwUdNY1av2K98fHq
 9L1gyTNkoPPRYh5b5bPwFszFF3sAT2QS9sFfh3jSZuq2ILOQI58FHtOdpvI5d4Va0jbi
 yxjVXeUumlbi7af5Ug0uc/K3mzxQPDcbc+qLsDgkPvb58vniJp4WZan2mH33nyUA6h2w
 SmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vGlAkEH2/PPSKi05hBKHIz6ip5pJ7iqA8snNo+QhlWI=;
 b=MRasKlY1Z2csSQdTuvz/SY6imR/8kdaHpG6vMJFdDbsK1LsUkN7FqVKneCDrAdJMUw
 zUPfxZauBbtyuw9Qik5V9DBtN8eJxM4aU/yD4/2mmWVlVFIOyX5mNa4PDkFt222RzP4o
 yM/L9tf8VzhaDtalxWGiXdKX7v2cXxFlDHOdbmjd6JfFOusSC//OP8D/e63VE/XNgZkl
 XEbYFxQA8lfdU/SZbB1iTbUlh5GktAKoRRrSM0Iatze5meoGKlQOeq0/4Ef/VP+KJH9m
 RFGG3qlEBbOeBrhV/GnkD5mBi2K6h9IuDw+i3HTEymN202anOkjA2OAB47G56sCR780R
 dqsQ==
X-Gm-Message-State: AGRZ1gJwdgsAkkDwApU8AUQDi/m6FyEtvQcxL6mO16Yp910Nmle1u/AW
 DJ5aWBrfmokTqgHMKJDYbqLMs6+qUGMkTmQauO8=
X-Google-Smtp-Source: AJdET5fHZgdODE+53lYBYzEZXTCpXZpl7C6ER8pYPgGKDmZgHL3Qjd4ACnMLtdQR8TORaIXrGPD4PKCOzbEb7FkNCx0=
X-Received: by 2002:a5e:df4c:: with SMTP id
 g12-v6mr2787731ioq.21.1540576752147; 
 Fri, 26 Oct 2018 10:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
 <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
 <CAHsrh9KDjs8jg-x4NYooVH1cvmzv=em1C7=6OUBaUx1cOCVG5g@mail.gmail.com>
 <7D625D67-C92C-40A0-B216-6A33EF805BD7@fb.com>
In-Reply-To: <7D625D67-C92C-40A0-B216-6A33EF805BD7@fb.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Fri, 26 Oct 2018 20:59:02 +0300
Message-ID: <CAHsrh9JB13DDETbDhbvkVbLb5PoRB9EFJCVj-c9TKU_5oyZP1A@mail.gmail.com>
Subject: Re: Host console logs service
To: sdasari@fb.com
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Fri, 26 Oct 2018 17:59:16 -0000

How can I create a gerrit request if there is no git repository for
this project inside OpenBMC?

Best regards,
Artem Senichev

On Fri, Oct 26, 2018 at 7:18 PM Sai Dasari <sdasari@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 10/26/18, 7:21 AM, "Artem Senichev" <artemsen@gmail.com> wrot=
e:
>
>     I have described the architecture and service capabilities:
>     https://github.com/YADRO-KNS/phosphor-hostlogger/blob/master/README.m=
d
>
>     Please, look through and let me know what you think.
> The writeup/description looks good to me. It would be great to submit thi=
s as gerrit request for wider community review and helps in commenting inli=
ne for the document and have design conversation. An example for ongoing re=
view @ https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/14712/
>     Best regards,
>     Artem Senichev
>     Software Engineer, YADRO.
>
>
>
