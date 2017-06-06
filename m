Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whghn3phnzDqKv
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 15:48:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYPISWdb"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id p144so9277384ywp.2
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 22:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mFaLtQwf/GrIIySMHCjYzk7FVO+ViPakhRaAq6NvPxI=;
 b=cYPISWdb//KNjCrX8A5v19/ANzB4uzzqGpr2kxL8y8TifGMhjhSNHpx5yUfBkBWUSZ
 YYQ82YjMsmnbldNUfBb222qbsJkWvJ4eeZkJDwY5NRYeQkcRDmTyZmWNtvmS/RkyoLF+
 Plmr4/SwPufVSwvLfddRgpuAgLuHkH4mCe3W6rviAkg7MwS5aNWz2UV3LLiVqW8tCn96
 8bA6C7AWSf8GrpnFT540IZURFqT0imeV1qESjOu6ejTb0saMRrwRPCI5ZVLO4LceXcud
 lY3Z5DFpiAz5h5JS7eCDrsfHe0WIO3ly5t13c68I4y4QanNuCMThES80Gz+7ZepD7F5T
 L8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mFaLtQwf/GrIIySMHCjYzk7FVO+ViPakhRaAq6NvPxI=;
 b=ofXusE5T4yzN3MzFlAQCLgt5Jyt3uC6PvvoAbWtHu0pWLLys/79rvXBawPkDGE5634
 cGHZTP5A71eBZpqtMCycdTPF3UkB5TKIkLyzCvLMOtMdbfLuWuNDJogc+adi/mNwWK/g
 lI8BLAoGx8c9trr71Opk9Nd1LyecIkLfH9f61W6Nyj8ZMuRoVi6mZmTK5AXeMMXcojIy
 SJJQFiqg4TevY1exFEA+yV4oEJAYakMefyfaDgJqkuVyWoQ98Zb4Ed2gmEJG9ZNxWs9M
 anwXoTTchAdeLVZAB9GTnhtIc6QZf17v+R4fMOLeOr2xuyrNh0Gf3GZmws++ipsvMM1F
 0MZg==
X-Gm-Message-State: AODbwcA3hm60dPm9mCuWvrmqEltUj7JAju5eXxs6kddb9sOJIkrawv1v
 nhH84oA3sGfienINOMIHQ3+iHnWjLcf9C8g=
X-Received: by 10.13.207.194 with SMTP id r185mr1366389ywd.135.1496728103607; 
 Mon, 05 Jun 2017 22:48:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Mon, 5 Jun 2017 22:48:03 -0700 (PDT)
In-Reply-To: <6cc0e085-0867-4128-c815-4ff74da1d5d7@ozlabs.org>
References: <20170605074301.11310-1-joel@jms.id.au>
 <6cc0e085-0867-4128-c815-4ff74da1d5d7@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Jun 2017 15:18:03 +0930
X-Google-Sender-Auth: -nbXOL0bjdsNdjSvkE_CmMeIKIQ
Message-ID: <CACPK8Xd+afTCFLNGfwa-=Y7OtgtaXohE4g9uTo3P22Ef_GYoxA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add devices under FSI
 CFAM
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 06 Jun 2017 05:48:26 -0000

On Tue, Jun 6, 2017 at 3:16 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Joel,
>
>> This describes the SBE FIFO and OCC device that are attached via the FSI
>> bus.
>>
>> As this layout is common to all existing p9 machines, we add them via a
>> dtsi.  This dtsi requires the 'fsi' label be present.
>
> Sounds like a good idea, no need to replicate the p9 FSI topology in
> each BMC's device tree.
>
>> -     gpio-fsi {
>> +     fsi: gpio-fsi {
>>               compatible = "fsi-master-gpio", "fsi-master";
>> -
>> -             status = "okay";
>> +             #address-cells = <2>;
>> +             #size-cells = <0>;
>
> We might want to keep #address-cells and #size-cells in the common
> include, but then we're splitting properties (ie. compatible) between
> the two files. I'm happy either way though.

Ok. I will leave it as is for now, but as we extend the FSI dtsi we
may want to revisit.

> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Thank you for taking a look!

Cheers,

Joel
