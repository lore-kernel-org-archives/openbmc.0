Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Svu2rPXn"; 
 dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444Jd81kVZzDq8B
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 00:40:12 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id n71so40109803ota.10
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 05:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UYIW0sHEOoNFr0ViBldWKXXpPO2tTHK5wo9FaAZKX20=;
 b=Svu2rPXnGl6SundFg29a1mOirS3C1fiPGYn4MZG9t+da6jcx60nVSLDdRz4kgH5Z0e
 bN7ZyWt14p45T24TGEsdd4XmC3AToP4Vaa8r97pcS9SMr6K1AQze3F2/HPjTwNviSjGr
 /fKIrmF7CVYDYA3f2IrIp5ogKFV+e+UoNFJU/dWu9xQSPRbYwjBBiN3bsWI+SOoGXfM9
 dUn0WatwYR99sJOqfPlvxmj4MLEg68+97EmbONQTh3xQgtVQQ2X8Uf4Q1A30GSyYCrOI
 WB0o6m/zlnWjsdRDnTt3lSSFsIK9vaXJLHn7R7fp+I6kq3alRinf+Eh6qPj1iCm2gDcU
 BEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UYIW0sHEOoNFr0ViBldWKXXpPO2tTHK5wo9FaAZKX20=;
 b=dkXv8vlSjDKU0JWuUN5x+PEuauQvgENs+oGZaCYVXdUdc9z3pUqXbQaYWCI1IQHVvD
 uDpRgeYvQwGvdPN8r5g5I0/u0pEFlx3N5NN67O3BI+HR6RrYT+UPTL8gvx3z2LGRJxy6
 Uwc8d8mmNyeWKDDJwzgUlhWjrC70JnYguwzo7xPiifPxRMXdkFcAMqRUuRvAQkHg6Q/a
 +6DwaCwwCEjf51bPWHeYr+AAVzKvwD8VGLgpWWvOx3hMvadi43f/eXBccka8UPl674p+
 HRpDgg2N5x5VIRAGwYO4PbYBgIrylGloJOt5BayO67bhpBc22nPvH48pCeArZoyIa/lE
 hHrw==
X-Gm-Message-State: AHQUAuYDMsRngY6U3JYVhDRp4Of/YLwtrJYjxiHrb3XxaHZoRcREI3zy
 mkaAC9Qlly9M/cQNUsAt5MV7S5U65q3AWhWjXwYn0A+v
X-Google-Smtp-Source: AHgI3Iaw02JDR0PXuCZnWSAcyVcjAt/hQNPZQRWz+k+AdyShfMCqIWmvVMallGn84NENPFN4V1NIdnm1OeQ8TjdIIFE=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr20966201otl.12.1550670009752; 
 Wed, 20 Feb 2019 05:40:09 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 20 Feb 2019 07:39:54 -0600
Message-ID: <CALLMt=pnw3wmg-pR_6N46Yqbiyw-dqJVX09aCyozkZ8i6EU49Q@mail.gmail.com>
Subject: Infrastructure Workgroup Today - 3:00pm CT
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
X-List-Received-Date: Wed, 20 Feb 2019 13:40:13 -0000

We'll be discussing the new gerrit groups, disaster recovery, and some
of the ongoing issues with the infrastructure.

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
