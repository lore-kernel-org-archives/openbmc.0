Return-Path: <xow@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rb8TF1rmBzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 04:03:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=OXOa5ZLH; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id i123so30897311pfg.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=to:references:subject:in-reply-to:from:message-id:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=K2Q8B84a/n/T961WUtgc8wDGXIdvr8oRLB9OJWhAs1g=;
 b=OXOa5ZLH9fhqVuk/ky69TJjBvr92xZwwrHDonQCrrCbhjcnC5L6RB7AqmESWGQygiB
 WGrtBEGV2zi/R63VmbbQDQqD8FwtdAvyEZBcyH0LDVdHmIbuB+yaDbvTLEgPwRjgK8B3
 GnD274w5lWVyVmWSIlb6HAaQCqDdBZUBD3+miXd5OZQJS24LBFytZ0wZsu1qu0QjiEAZ
 x1y6LdRI3P5bb7Pypbra1b4gffzp5A3tPMt8YChdTwvaNMKLTgmzvAeC9FOoy1viut59
 8/C3VsbqnfH+6Ymea4z61PYkZGQPf0WEQx/iRZwTO+dt5OWVCJavdVioAU4d0ADzVPlt
 kf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:to:references:subject:in-reply-to:from
 :message-id:date:user-agent:mime-version:content-transfer-encoding;
 bh=K2Q8B84a/n/T961WUtgc8wDGXIdvr8oRLB9OJWhAs1g=;
 b=F0ehH+Dye6Z/n+zpP6QNfJe8BcCOW/y/oOJzqQ17zbHXOb6TivpSWqrlI+7vcUCqcY
 SkOmdAxV4KTM/Vvcn4qS4vK6Lr1E/yXIwMMxKnmgjZzfCG6290X51bok5QekuPlDSbyA
 nDO74sEncQvDxEAAmq6TEN7IDraYjoychMqM7OjquOE0G5QIOuA5wJL+Jo7DtQhox2bO
 N+eOP2yJcDv9TKsGA8iSMGaD0BFJinkJ3KhIHZjoKen8ZcZDHG1bfTRTRiDoXNRdnEr9
 Ik75HFZ7MvuYa6z0m914hMgeRkDVJllyBD/Efp64L9LVNdMtKsxMiBkBJocDNMyLAgqA
 SGxA==
X-Gm-Message-State: ALyK8tKsI2gKPcMimnxy/SwTL3ilzem+SknURBek+T42I9B8i1Bjbjv31pXggfITUFoJ2xtM
X-Received: by 10.98.39.68 with SMTP id n65mr5605510pfn.153.1466704990118;
 Thu, 23 Jun 2016 11:03:10 -0700 (PDT)
Received: from pewter.mtv.corp.google.com
 ([2620:15c:202:0:1545:4687:d697:25fd])
 by smtp.gmail.com with ESMTPSA id 64sm1559897pfj.96.2016.06.23.11.03.09
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jun 2016 11:03:09 -0700 (PDT)
To: openbmc@lists.ozlabs.org
References: <CAPLgG=kfYKVxnd1k2sEdz_sW7kLoV4ZnkDYZKkztiM9=ATcrqA@mail.gmail.com>
Subject: Re: [PATCH] aspeed/ast-g5: Simplify default bootargs
In-Reply-To: <CAPLgG=kfYKVxnd1k2sEdz_sW7kLoV4ZnkDYZKkztiM9=ATcrqA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Message-ID: <576C2457.1090606@google.com>
Date: Thu, 23 Jun 2016 11:03:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2016 18:03:14 -0000

 > I believe Xo sent a PR with the same patch.  I
 > prefer to drop my patch and follow up on his.

Joel et al had included a bootargs change in their new unified U-Boot 
branch so I dropped my PR too.

cheers
//xo
