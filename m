Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RPehikVW"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vhlS3FJvzF3HX
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 09:15:32 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id w25so12166784otm.13
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 14:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v9Gmo1HeVAdsBkimBZreYhQuj3TcnzeOdKe7lnZ+Dp4=;
 b=RPehikVWC9Du/sj8QpWqZMrhbPlBSIA/GTvA0MylMzd+dCDCsl4/w+WIfVwRaoZ8v/
 1qD9Gr6vaAY0rKiH7BJbNpaYxMp/gEciGYDpwCcK+BuL7cMbwrkkbbOYsiVwsQMKEzJ+
 x3MIyxYKTKLOvgE/gJuvUnSupXJzW9iUUfkJjXJyM4TX8eIRjbsUhQw2CtkjaqaGS3qJ
 7RLjfVJeBu+PKXf2qprsRGuIkRbIQWkCwjgTva0PFqYY2St5tAoHzBfY6sxFStWWwixo
 R4H1UsPFSd8PwgkeH+D05ce7qBJcTGOsBCo4BVDy0+wwlpCu9vGrWmrYgLIVn/2+AHHa
 4bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v9Gmo1HeVAdsBkimBZreYhQuj3TcnzeOdKe7lnZ+Dp4=;
 b=f2vugd5+qwgQcyBDSf0m+xSM/e21Msfn4k26bdNiwGkl+rhV+3KJBUXp0mFfNOdPRq
 BqV87Xsu40x5jF7JVJWC5e0o/5QfCE02pU7l8ou5SrUgCCyeK6t7A8neNjYCs+9yhzqx
 cWxm/LMFkCm+HCc1jy0SM3klXp3eOeIpbk6psx8IGhad1r4xOa/lGQM4h0wcP20UAYC0
 n73EsrHqmP19pYuapK3jUPTlqcHnoAkJA1uZCuID8pHFx3WCi9+wo/5km2tcJHh4XR3j
 bB8K7WkWjvT4A3raHW+hPxwcNAO7Hf+28vr+ztIfpdLXHd94tdrM8WWe+BfNrlmVFQIV
 G5Wg==
X-Gm-Message-State: AGRZ1gJ7Hz1g3torWzR1Q9CtvUZ/oFH6gsek6O88a1kknjWY0xGYmgTh
 UwFVx88IaWRhFDtqLEc2qfwoDGGcuW/UtEWFFEQ=
X-Google-Smtp-Source: AJdET5eWQ7/V35SfUZxj7nOIAgSqcnPnv3ND+jOLYoNTAUxzNmmCwaHsRu1vGBR/XxkJOaYC8S/zGc7KlHtZ9/wXLo8=
X-Received: by 2002:a9d:2ece:: with SMTP id w72mr3979130ota.85.1542147329590; 
 Tue, 13 Nov 2018 14:15:29 -0800 (PST)
MIME-Version: 1.0
References: <0000000000002cf60d057a7c257b@google.com>
 <CACPK8Xc7M0QLB4rp3xf6mWzq-cVKrEFCWm7vhNoORwv3Fzd2Hw@mail.gmail.com>
 <CALLMt=r8i-bugAiHYwdbB+MadLV01FKnr8o3N4g75Y66LMhoLA@mail.gmail.com>
 <F19DABDF-B5E9-42B5-8001-1632DDF1ED8C@fb.com>
In-Reply-To: <F19DABDF-B5E9-42B5-8001-1632DDF1ED8C@fb.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 13 Nov 2018 16:15:13 -0600
Message-ID: <CALLMt=ojiD4ufVKUJfR7hwLTTMsZERrwjmsnRTJDMzjijM2jSA@mail.gmail.com>
Subject: Re: OpenBMC Infrastructure Workgroup Meeting Time
To: sdasari@fb.com
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 13 Nov 2018 22:15:33 -0000

On Tue, Nov 13, 2018 at 3:54 PM Sai Dasari <sdasari@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 11/13/18, 12:42 PM, "openbmc on behalf of Andrew Geissler" <o=
penbmc-bounces+sdasari=3Dfb.com@lists.ozlabs.org on behalf of geissonator@g=
mail.com> wrote:
>     > >
>     > > The opposite week of the test workgroup, Thursday, 10-11am Centra=
l
>     > > The opposite week of the release workgroup, Monday, 3-4pm Central
>     >
>     > Do you mean Australian Central Standard Time?
>
>     I think based on the feedback, I'm going to try for a every other wee=
k
>     on Wednesday, 3-4pm Central
>
> Is this Wednesday or Monday as per the original poll?

Yeah sorry, Kurt mentioned to me that as we get near release time, the rele=
ase
workgroup may want to go back to a weekly meeting, so the Monday 3-4pm
one no longer worked. Since the afternoon was preferred, I just switched
it to a Wednesday. Does that not work for you Sai?

>
>     Thanks for all the quick responses!
>
>     >
>     > Cheers,
>     >
>     > Joel
>
>
