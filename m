Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FrskbFvo"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLgcg4rxkzF0Zp
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 06:43:15 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id b76so22401748qkc.1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 11:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dp0pUl3sHBc53ou7OWEVG550zUZUp2YK68WKLozJac8=;
 b=FrskbFvot19kGdB1W7sbkhfh88ThhVhATIWBYENAq9uePm12ILCQTYfFAg0tDPRv2S
 N1Q/t3EM4d2alMsPklI41UdMX0OQ8bRJCIyvhNeRCdNn2x3ShHoUBlqENN1Sce4JSYRB
 OPRVLZHgHqnMg4Au8PeMfqUf5O2gnIkw9Gxrevw4YkuGJE1Ug1hJfODXP/DIFU+gQM75
 0J5CNgbbh+1y8HpMcqn+Wj2OtdJZ4cggGa5QG32bGC/Mk7LHsbvE6rjbvO9QL2RvMYPw
 QWlfgoD4d0Vi3OGAQ/SIfoaBcC8hZpNlaqxSJYS1q00S9pmVuV57hEIbnEvitc2i3Kya
 gByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dp0pUl3sHBc53ou7OWEVG550zUZUp2YK68WKLozJac8=;
 b=j8pPPRm+hs71bAovfLxmMVGWvAfT+fS0JAXn0YbRlz2jm/dBKT7IwUJEDG9xHsHqo1
 6Psf/5XOyT/DjSEYS9xaYUNFaIhV6HdHb5WWuaN7BOuj2/SLjdr3D3TBdJRYBCcnxcH/
 k5D/9rby3iVzKoe9XSOVq16BLZBewJiMKqpW+0xRjZG5bi64bHMn5Q4f11RkFqo094kJ
 tCniNBJuPwA4sk4hZTS4Er76UxrmqPoyKxMjEHLtOjuKJTqW08UvRlePzz+D8zYwIV3N
 XXnB3Gc5YDMPQx6wTRT0DQ0vO4r3fVAldoikDE+kSvh8hngXYRLBjhV+Al76XJ+wr6PG
 AbUQ==
X-Gm-Message-State: AKwxytfGxtNHtxDy/zJHj2pyn7zum1vyfX85lAr4I5yTRucWwj2LSVV/
 /WqEDM/yrw8lAKw1yiSp8VeZ4/O8HFsHhIOyA4Q=
X-Google-Smtp-Source: ACJfBovEiLjg4/UcR7zldq7Z4Lia2s/LhX2Gv6qvoYlnKckOd6itaMI3xfv/UQdPsNlqmAWVcJdPREL4MjQiim/uVcw=
X-Received: by 10.55.178.66 with SMTP id b63mr56226970qkf.246.1516131793355;
 Tue, 16 Jan 2018 11:43:13 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 11:42:52 -0800 (PST)
In-Reply-To: <CAPH-5w4VWj2J9wqHkMUWpZ4Xe9uMEMkt1LT4xDLL84HoOZHvsQ@mail.gmail.com>
References: <1515057847-30492-1-git-send-email-mine260309@gmail.com>
 <CACPK8Xf64OdfqNZiyu_v=hxB4YrgxPN5SHzxUsbEGkMbGqVwKg@mail.gmail.com>
 <CAPH-5w4VWj2J9wqHkMUWpZ4Xe9uMEMkt1LT4xDLL84HoOZHvsQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 13:42:52 -0600
X-Google-Sender-Auth: jNrOsK_Otxe1ow5rOLhS8ln6Ioo
Message-ID: <CACPK8Xfw3FF2nkdkrUC45tQrWV2mhbT-oZLkGfCr_r=T_Um=pg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: zaius: Add
 pcie-e2b-present gpio key
To: Xo Wang <xow@google.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adrian Barrera <abarrera@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jan 2018 19:43:16 -0000

On Fri, Jan 5, 2018 at 12:48 PM, Xo Wang <xow@google.com> wrote:
> Sorry, just got back online after travel nonsense.
>
> On Thu, Jan 4, 2018 at 5:58 PM, Joel Stanley <joel@jms.id.au> wrote:
>>
>>
>> On 4 Jan. 2018 20:24, "Lei YU" <mine260309@gmail.com> wrote:
>>
>> Add GPIO key to check presence of PCIE E2B
>>
>>
>> Xo, can I get an ack please?
>>
>>
>>
>> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.10.

Cheers,

Joel
