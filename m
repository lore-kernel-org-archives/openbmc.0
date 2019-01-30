Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Iy2a5V9M"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q8222kLrzDqSc;
 Wed, 30 Jan 2019 14:27:38 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id z18so12892272qkj.10;
 Tue, 29 Jan 2019 19:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0b2GDl2yieLIyx2pFYrqOUiHxYeTYtmKw6/wCfFz+T4=;
 b=Iy2a5V9MHKAxrlKsnJ9rvNj4qf16/5BykO68Vm7RZa7LecX/MGwVbwNi7xKfBVOtT5
 k8Q5Q5jLXd0GA3BlUfmybllg9sTRLNHMUFzFwBbuCAtT3aGCnHizLffXYtk9vV3wac01
 iDO2opyMPNA4+IjQD82rEXt18DZys6H7bUErg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0b2GDl2yieLIyx2pFYrqOUiHxYeTYtmKw6/wCfFz+T4=;
 b=stzWD9H40Sn1YZLTl70k4jcz5/qOtxJa2NUtNNXQYmwsK0RfgRYlMrGGXKBuMQcqD8
 GEV+GUVGw+d6WcYRiT3anam1FGaGOc0U/C/TgNgU4/W8hOltSuDbQ6/+2niE2n1pQPVR
 Rq1NMZeGqsiJk7U0C4mt7UMhlOTgmcCOOLNl2eMpQj0VhHVd1J22TahOTgIpy45e7KNQ
 i4BzSKbccuxlaLPKWzs1LXYxHwC/ojphAe6KKe/hFjK3skRDJrS6wu97c4pbU3JFb0hJ
 752cUGESGOJzSENd7Wud1NutVf2Lv5QCKXvpNFSKfy5zAhWZ/ipAxFXTxigUt3PJwDpU
 IL/A==
X-Gm-Message-State: AJcUukefV0N42cDv/zfulwSaZXwuM2WmP5dafbkWww8NVAwQGOWoV95A
 FQwrTbrsKOmATWUR7489NLCvz4RpkIGImR1VTtQ=
X-Google-Smtp-Source: ALg8bN5KS647Oz897o2Lp4q/4anxz45TJI1E5O6Dbhj26ozy8v2BKx5KAQFns7kWbyI/ya5kUEmqLguF66sAaUDJLWM=
X-Received: by 2002:a37:781:: with SMTP id 123mr26025466qkh.231.1548818856336; 
 Tue, 29 Jan 2019 19:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20190123230733.1821501-1-vijaykhemka@fb.com>
 <20190123230733.1821501-2-vijaykhemka@fb.com>
In-Reply-To: <20190123230733.1821501-2-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Jan 2019 14:27:24 +1100
Message-ID: <CACPK8Xc-abT8Y9f60qt=v3TQ-=fQ3k7YzJGS5Y2MN0MDfRY+tA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add uarts for SoL in Facebook
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 30 Jan 2019 03:27:38 -0000

On Thu, 24 Jan 2019 at 10:07, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Added uart2 and uart3 in Facebook Tiogapass for routing serial input
> from Host to BMC for SoL via LPC.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Applied for 5.1.

Cheers,

Joel
