Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aKULhm+Z"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnqmy0031zDrVp
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 16:10:09 +1000 (AEST)
Received: by mail-io0-x241.google.com with SMTP id q64so423700iod.5
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 23:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=votPbZ/1fTKrMVdo5rG0i0OUpwi47/MVxcK3rxjniXo=;
 b=aKULhm+ZD7DqQylpTXfHTSqkQPnAcoN/XCLENIJR76w6NVeZ+4W4EqYoRLzb8LFFUj
 epobBDMp7dG6L+VyYbqND0jlFtUjlYj9jGjRIC+jzmA+WeyzB+gmWnNrDEXNH52w9lDk
 bHkN/+AaBmQuZxUg+gJSKlV9Gau/jivmFufw2Smk5IYH74gUHbPs8jRcqRcWlbkXlrH2
 WQAOdQcy/RnGqSE/orI0q0WKZQXSFDguc+MOVb05sAvk8AqW+g1Y0MTNxHdP4msDWRDN
 PHBE7UJhy/tPfCuj3wapVjQgiBC94pCyfeJ84PgcZNbawP+x4vsthXarjnhgWeC5LObP
 7mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:message-id:subject:from:to:cc:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=votPbZ/1fTKrMVdo5rG0i0OUpwi47/MVxcK3rxjniXo=;
 b=bPiIXPmLlt2/H/2qDAwC3g0Ld5fblZ1o0cBTZ0PZfmNF66MfInF7n5GCRhxbDmu4UF
 7IYIDMs5J//4R4rkAEKTConWEPr4FwgqQuIj6rw1v9tAir7U6da0u9yiOCJa7La9Ocbm
 Zy4F6Chn2+cvYyFltEWu2Prm4w6Y5NnnI5DGG2DGZyqZIadvfJTmB2FbBOFTgEpfhQt/
 vAmMitXpjgZp2sAaWfuSo6G6Xd5v2d7lf2qYybmDEejGB+u8B71/mPBfXMeNtf6T96I4
 07vrnovnVPPVOV2vf/9Upqe0XEuC3dzALwxFc9nMwqp63Mf5bcfqZmF0tKKGiobtieBR
 0dPw==
X-Gm-Message-State: AHPjjUjVUICKw/BlItRiTgdMJ3A+toL7bS0gg+0ibubKWnvJSXoQ6hXB
 4E8UXDp7YkUagw==
X-Google-Smtp-Source: AOwi7QBMdf5JX2bGpRGqjzrTtOMkZhQtuBQncgAe9E+ltGrKX4lj2Y09nCl/J01FE+7QXDCAtZSnPg==
X-Received: by 10.107.53.158 with SMTP id k30mr1738797ioo.338.1504764606970;
 Wed, 06 Sep 2017 23:10:06 -0700 (PDT)
Received: from aurora ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id k199sm827164ioe.51.2017.09.06.23.10.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Sep 2017 23:10:05 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1504764598.24443.18.camel@jms.id.au>
Subject: Re: [PATCH v4 2/3] arm: dts: add Nuvoton NPCM750 device tree
From: Joel Stanley <joel@jms.id.au>
To: Brendan Higgins <brendanhiggins@google.com>, robh+dt@kernel.org, 
 mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, 
 tmaimon77@gmail.com, raltherr@google.com, f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Date: Thu, 07 Sep 2017 16:09:58 +1000
In-Reply-To: <20170906080751.6773-3-brendanhiggins@google.com>
References: <20170906080751.6773-1-brendanhiggins@google.com>
 <20170906080751.6773-3-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.25.92.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 07 Sep 2017 06:10:10 -0000

On Wed, 2017-09-06 at 01:07 -0700, Brendan Higgins wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Avi Fishman <avifishman70@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
