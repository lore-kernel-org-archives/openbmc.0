Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="jNuAYyca"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44N5Yq22WZzDq5Y
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 17:17:00 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id v20so16641011qtv.12
 for <openbmc@lists.ozlabs.org>; Sun, 17 Mar 2019 23:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=eZNL4HgdspO6kgQsDwptOt5a2pqlJ9pCvQ9BN1/CogY=;
 b=jNuAYycaUqFtcvIOGP4vYRfGsITkqeKvRO7Pv3xZHtH/H+p1ClJnyWWogEKQz4ZZWc
 IIWn9x+yjU2mnYT4QeqVC6vDVWC//x10b/AMaNlmNdjxRzXVqEdCEhFb0HZVaBoh7suv
 PVbHFZYrhm0Cw0lsd4kZKK2mFrlpfriIT0BOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eZNL4HgdspO6kgQsDwptOt5a2pqlJ9pCvQ9BN1/CogY=;
 b=P8UZOSwlFWJVCGE+iC7RfT0fvDWXTTOlGmNWdagQxc273BQNKUQTo12PA41HFMKViT
 E5wLGpGl1Sf+fA2iEyiqayQuAIf5m2LhpiBdgxMLXH9Cm09e2fQCCo4K8dOK9dji5V/n
 zYwJkkFbBqhDwNvqhQpSFpqcOEQVi5Q4tUbrO6FRRVmtnOfHRid0FlVMvbdAvqRlzYDf
 EKSqU7yf3ZSPjwet66i8zbgW9Z3KVC8JmE+gUPvS9hi28rFAXZwRXi84BeES51x5FSNe
 9Qo8ObNqAb8h1VDovTYl3t83SkL2Z1H8TePDL2csSysEcyMDMsz66+SuhF+gFQFf9TKq
 PPoA==
X-Gm-Message-State: APjAAAXdv+jCGMfI0cf47y4vWBZC7d9UgOms3eO2QFwRck0POPgYiCRo
 /xc/XBqK4DrGeKqVvtoE5oBptpyyHpNymp1ZGZyQZA==
X-Google-Smtp-Source: APXvYqzoYU7a/FHcgUoJAMwuUBfqze5VBiGIbGD6Igd6HT4Xj6qF0lUKNw4lOcM/TsCy8tnsGIGgQntFdikORYcmVYg=
X-Received: by 2002:aed:32e3:: with SMTP id z90mr6770708qtd.266.1552889818530; 
 Sun, 17 Mar 2019 23:16:58 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Mar 2019 06:16:47 +0000
Message-ID: <CACPK8XdnESPUxPqX005x64sCehJTPyBw9vnCyHk7UP8vMrz1vg@mail.gmail.com>
Subject: Moving to Linux Kernel 5.0
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 18 Mar 2019 06:17:04 -0000

Hello,

It's been a few releases since we bumped, so I'm going to publish a
5.0 based tree this week. I've done some testing on the machine I have
(OpenPower Romulus ast2500) and it looks good.

I'll be rebasing without discarding patches for this release. That
means if you have non-mainline patches it will still be there for
dev-5.0. Next release we will do a cleanout, so please ensure your out
of tree patches are on the upstream lists for 5.2 now.

Cheers,

Joel
