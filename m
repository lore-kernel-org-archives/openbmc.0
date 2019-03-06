Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Dp1632YMzDqBY
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 20:11:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="rBoo3un9"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44Dp151lS7z9s00;
 Wed,  6 Mar 2019 20:11:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1551863513; bh=l2lSWjTxjt+oqFw87NGO8qDqjSTnvCQST4q8uPlis44=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=rBoo3un98Nd1M/9HGpXL+sGgedgDRK7FhB2cu0J5DC1gxoJRdzB6wienYq/6CR8I0
 tsBX91ZEDdehkhkPUF1n6bS5RoUakAX6KRaDxX6DMkjLgYDHL8NlyWXoUVIUwrrHzc
 1aLupDejAH/6Lfsdi58+A7fseSpKnAcEPAz0NYlFvAyBtzTgBVwbfc4TbzPrXLlQ49
 fiw1VabIPidPMRUe9BFtObcjxcSkJ+yCSG1BSPQRWlRN3ZowNR3KyljLAnH4U93+RP
 fzOazb1nmJBxzPt4H47qmzv4ON8kzdyua4MFcs1KXYSiU5f1/gMROqczf6zsmoItXW
 63ydd0OqJaDTw==
Message-ID: <a85a960904419757f8130938af0cd362203b9c42.camel@ozlabs.org>
Subject: Re: Change in openbmc/meta-phosphor[master]: obmc-console: srcrev
 bump fcf8541b87..f9c8f6ca86
From: Jeremy Kerr <jk@ozlabs.org>
To: geissonator@yahoo.com, cheng.c.yang@linux.intel.com,
 ed.tanous@intel.com,  adamliyi@msn.com, openbmc <openbmc@lists.ozlabs.org>
Date: Wed, 06 Mar 2019 17:11:52 +0800
In-Reply-To: <0r6d35AXTvWuePCe4ab7Pg@ismtpd0006p1sjc2.sendgrid.net>
References: <gerrit.1551749502093.Ia129db0d7e0e087628505cad9ef3516dcbb15eee@gerrit.openbmc-project.xyz>
 <0r6d35AXTvWuePCe4ab7Pg@ismtpd0006p1sjc2.sendgrid.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 06 Mar 2019 09:11:55 -0000

Hi Andrew,

> 01:43:28 | checking whether make sets $(MAKE)... (cached) yes
> 01:43:28 | ../git/configure: line 3944: syntax error near unexpected
> token `SYSTEMD,'
> 01:43:28 | ../git/configure: line 3944: `PKG_CHECK_MODULES(SYSTEMD,
> libsystemd > 221)'

Looks like we're missing autoconf-archive during build, for which there
are two potential fixes:

 1) depend on autoconf-archive; or

 2) include the required m4 in the openbmc-console tree

Is there an openbmc-wide policy on that? If not, I'll go with (2).

Cheers,


Jeremy
