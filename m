Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t906C5kQDzDqMx
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:30:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WfC2xWzl; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id y68so5977147pfb.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id;
 bh=ZSny3yyHIB8ZLaQW+qzIQ8LtTa9fLjTH1oI9ri1ufkE=;
 b=WfC2xWzlR0RXUsteeyWSEY8x6/5zQKDrU5Z0bcZ65K0WYr9Pk4sh9ocF/LmfV5f7bP
 Uj2KKYswk5DOFiiQAwFxJhmu7uJujMk91OmZYK4KtmsKlS/EM6e4CbNC2mpVKFMCcPuF
 aRVTJuMhBzFyOx9Gj4jIiqfd65yspfwytqXgdxuajogdgnQbK3UcOTo2ONKhqJ9PopLf
 LqOnquccCJUWOGgreMddbvSUMHjFTidiT8qY5r2H2HyGqdoLE8uqpk1Wchhw5ELcW2e2
 fE5t31L+hI9oFxmkca7LZ2VwHhb6vfCfbIfCv0fIcyh5xMjCA//I/f8oa6uvFAITyvPf
 h0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=ZSny3yyHIB8ZLaQW+qzIQ8LtTa9fLjTH1oI9ri1ufkE=;
 b=eXDqURrVJfZd7SKnMk9jK8CAoNcNGM2XXlXEuQaBTum2MVl9o7EwEsM0I/aQXmOjY2
 J90GsOdIJZZMNEEtQjnPqcUv9KUJDoCnaCuO6w3uaQmN71FSn9ntasS9wVSbk6sLXwFm
 BBeskkjxuiLhu82gf/jv9ZobLCjhGG4uYKEmH7CduKYlxgNFSzyty9uPybWZ/0L92KyF
 LZg/3n3tayf7cEKcIuILBskhZRSi5JqKPCK8INw+XRWvZGpqKKCBZRauLWNofDihuhTj
 4JZbMAf+FVKMLysHedvmDRJK3sDO8oU4m1ui2fhW7Mx0yWsNhQjdnj+nYWnLQbTxvlp8
 M2Sw==
X-Gm-Message-State: ABUngveTMBji8pcJuYYdV0wxv4S5R5+BVYwRNwimnVf3dC0Auw+jXqZF+SJwGFc6ntMT/g==
X-Received: by 10.98.63.1 with SMTP id m1mr7236962pfa.31.1478212225709;
 Thu, 03 Nov 2016 15:30:25 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:3922:4bc4:ef17:3570])
 by smtp.gmail.com with ESMTPSA id y29sm14998927pfd.63.2016.11.03.15.30.22
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 15:30:25 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 04 Nov 2016 09:00:16 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 PATCH 0/4] Board file cleanup
Date: Fri,  4 Nov 2016 09:00:05 +1030
Message-Id: <20161103223009.4794-1-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Thu, 03 Nov 2016 22:30:28 -0000

This is the beginning of the end of the board file. Now that we have drivers
for most of the functionaltiy of the SoC, we need to start removing the hacks
we do in early init.

I have identified a few low risk changes to start off with. If these go well, I
will send a second series that perform a more complete cleanup.

Cheers,

Joel

Joel Stanley (4):
  arm: aspeed: Remove MDIO hack
  arm: aspeed: Remove Palmetto SCU hack
  arm: aspeed: Remove setting of SCU90 from common
  arm: aspeed: Remove SPI controller hacks

 arch/arm/mach-aspeed/aspeed.c | 21 ---------------------
 1 file changed, 21 deletions(-)

-- 
2.9.3
