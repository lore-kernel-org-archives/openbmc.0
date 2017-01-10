Return-Path: <roblip@gmail.com>
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tynRv4J7xzDqD0
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 09:55:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J8axrt55"; 
 dkim-atps=neutral
Received: by mail-lf0-x241.google.com with SMTP id j75so15976994lfe.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 14:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tiTxeMsTIX0jKCr136dXry//UyGkYAer0qdoQ+BfYAw=;
 b=J8axrt55vNqRFics+DrSyP6Mue5clEk98laUidZL143m5/OhDd6csZv4NM5BYRD3Eu
 7rWCmi6wQGcgRUhe/LPrHx6CrtqHgs6pSVCwEUoGXO9H7yVDzOcjcj/E4Oq3ANeRF3Ly
 42Gj2KAIeEALcDF8fQLij3aaZDmiCjyoqX8j5+FUnhS+Pc9IJtAwgFwtZ76/okNlTmiI
 YPkv0hkwCNJLO0v4KTzsxvFXh6rwbmBNeHWffShIvc/+P1oGdY5nWw0qi2DUwjYdGvXI
 bvDeHdRMDHEh0v7cFi0MOHmWMLeG9W+oqtff4a3PXlO9IIpt4znQOUiPoOem85YOG1z3
 Trzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tiTxeMsTIX0jKCr136dXry//UyGkYAer0qdoQ+BfYAw=;
 b=GE3c5MClfkpS9x32Wb8tMdHL/LUVak1RxOSysrNppEIkGTCvI9yOh8stq724LXlfiz
 K7qTFG6NF/Tn0FRtqelQUF0rg0kQ9vVVnGldaxytpPmzqkiI7fkWbEsoHubsa1ctJiit
 WwR487ee46QwmFpdnLGV+WCE82xmLxa1McoexWfXxDIl7g332MvepdUEY19fFYPimVQc
 KZel7xmyohAL8beCRv+kCWe+a+BBtSaZ2RgDVE8AWNWzhm/W/OpC1fapQq9azYgUdeFI
 aClaACC/eqmPk3l0MiLo0yJizdpWpRpe2yeOLOlN/iFZbR4NjeA1yI0UDSRDX80Ih98T
 Ff7A==
X-Gm-Message-State: AIkVDXI6h81hmCntHGxV5rrAzLIA2MftdzOyB4oelAzf+t9jFIKjE8umkH8rQw2FB/gS+LW/tDQrpTMb7qDkig==
X-Received: by 10.25.138.8 with SMTP id m8mr2157912lfd.134.1484088936403; Tue,
 10 Jan 2017 14:55:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.177.141 with HTTP; Tue, 10 Jan 2017 14:55:35 -0800 (PST)
In-Reply-To: <1d9b5e4a-9415-117c-06e4-060d1ca661d3@kaod.org>
References: <20170110010524.116687-1-rlippert@google.com>
 <20170110010524.116687-2-rlippert@google.com>
 <1d9b5e4a-9415-117c-06e4-060d1ca661d3@kaod.org>
From: Rob Lippert <roblip@gmail.com>
Date: Tue, 10 Jan 2017 14:55:35 -0800
Message-ID: <CAN+5HW0Hhi1bz5RZGn6N_snkUOp03D=9RAx9h+LM4u=-f8i=9A@mail.gmail.com>
Subject: Re: [PATCH linux 1/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to
 mx66l51235l
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: openbmc@lists.ozlabs.org, Robert Lippert <rlippert@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 10 Jan 2017 22:55:40 -0000

On Mon, Jan 9, 2017 at 11:54 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 01/10/2017 02:05 AM, Robert Lippert wrote:
>> Signed-off-by: Robert Lippert <rlippert@google.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> This would be good to upstream I think. As I need to send
> a little patchset for the label support in mainline Linux,
> I can include it if you want.

Sounds good to me, no issue with including this change in your patchset.

>
> C.
>
>> ---
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor=
.c
>> index a68073afe8a8..e508c25a47f7 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -857,7 +857,7 @@ static const struct flash_info spi_nor_ids[] =3D {
>>       { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>       { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>>       { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>> -     { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_R=
EAD) },
>> +     { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_R=
EAD | SPI_NOR_QUAD_READ) },
>>       { "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_=
NOR_QUAD_READ) },
>>       { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_R=
EAD) },
>>
>>
>
