Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRYWP74n3zDqp8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 22:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mGd3RzFb"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id u207so2261433ywc.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=PYAzyWWZoPgpgF+p2mXfkdj+LUNm0iWYrMVgTJyhKOA=;
 b=mGd3RzFbzd7mVYZzeZnD932EJYKIC7RjrIfCQQ8u3ZzdaGfNdCKJEwG4R4BWWp1tEI
 lET7YSbvcjXL/70HmAEsOn2y+h8+o/mi0mExSqkN/bcT9oQ+MCNhzi4gjnQme4vk8saB
 Aud2Tu8jY8qN4KWicezgQOWmI+vB8GKEo6YBTvnmz3NhyodJvNJb2O5FQNiyMBsVspSO
 ydtyxnQv99/MPzQZcNucRoQVJ7FLfn54xx3VKQpSCkOXY7uY384sLsB9lYa/0TzRVKiV
 AjZDPk1dmJzHvGzowFjk00x1gTupppygBxO/K54JbEQkqn5wA6AThU+hiyFuuuie1JCa
 rI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=PYAzyWWZoPgpgF+p2mXfkdj+LUNm0iWYrMVgTJyhKOA=;
 b=LGJWa6LPs+zH4HUbEkJhxnIhxlcu40Row+eWMwjqrjs27QQX3MPyLq3PRZnBLr/5I5
 kyQqQvC6uOCG9+2GRFb2NRSuwKa9Si9w/Ukpzqj2ZCewNzyZyjNE02pGzjXexhZtHeyF
 d7XYCaaNe0o1jeZnmRR09BPPz03Vohyc2FC8sjqctgLZdh01IoVGfPSf+dJBJT52vTeA
 CEDsvqz9p90TasP3KWLo134h9G+zjy9k66ybbLNr4o1h+cixkUiitAGoS0h8Zd1+b+UA
 rwfjUBu7WzCgHr83yeyacVhXKJYkABSljn61jBYzDjiGCE1Olr5bcylPCYMr0JIJ+bXf
 Xg1w==
X-Gm-Message-State: AHYfb5j6wo4gOa8vyw3Dp0beQXaTXpSzIqaHQ6mdiFhrmGh7eYBdk32b
 mvauUgnjDmft6YywMPNepDKkD0F2Lw==
X-Received: by 10.129.42.138 with SMTP id q132mr3196755ywq.276.1502195103368; 
 Tue, 08 Aug 2017 05:25:03 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Tue, 8 Aug 2017 05:24:42 -0700 (PDT)
In-Reply-To: <b8ec235e-b4bb-2fd3-75f5-54d96d500522@linux.vnet.ibm.com>
References: <1500562258-20214-1-git-send-email-eajames@linux.vnet.ibm.com>
 <ed57c99d-4ff6-300e-71c8-7afde6a61bed@ozlabs.org>
 <b8ec235e-b4bb-2fd3-75f5-54d96d500522@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Aug 2017 22:24:42 +1000
X-Google-Sender-Auth: hMfIqK3jnzJMrUaONf45VOYzFPI
Message-ID: <CACPK8XfE_f0sLWD5ffk3PL4jSenKo2u0rt1xj4EXmdPHbgBPeQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/fsi/scom: Remove reset before
 every putscom
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 08 Aug 2017 12:25:06 -0000

Hello Eddie,

On Sat, Jul 29, 2017 at 12:30 AM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
> On 07/27/2017 09:10 PM, Jeremy Kerr wrote:
>>> Reset causes problems for operations requiring multiple scoms (e.g. i2c
>>> over scom). Instead, reset scom engine during probe.
>>
>> Looks good to me. Out of curiosity, what kind of problems?
>
>
> Mainly I2C bus arbitration errors. I guess the reset interrupted the I2C
> clock line control during an operation.

I've applied this to dev-4.10. One clarification:

> @@ -202,6 +197,9 @@ static int scom_probe(struct device *dev)
>         scom->mdev.parent = dev;
>         list_add(&scom->link, &scom_devices);
>
> +       data = cpu_to_be32(SCOM_RESET_CMD);
> +       fsi_device_write(fsi_dev, SCOM_RESET_REG, &data, sizeof(uint32_t));
> +
>         return misc_register(&scom->mdev);

I wanted to check that you were ignoring the return value of
fsi_device_write here intentionally. If not, please send a follow up
that adds a check.

Cheers,

Joel
