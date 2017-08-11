Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x235.google.com (mail-yw0-x235.google.com
 [IPv6:2607:f8b0:4002:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT5rp4SQ5zDr1s
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 10:45:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mgJu7hz3"; 
 dkim-atps=neutral
Received: by mail-yw0-x235.google.com with SMTP id u207so14423928ywc.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5ra0P0sApLBLpHS1t9jpjr+GJf+Ln6w1lcjWKImcHOA=;
 b=mgJu7hz3QXOr7cdAs0/oPRwrO9novDitvPCn7YkSjYesKgIQWAZFKoFPW+IQM49Gw2
 MoJf3bsn9KGd45zqB4hpGNEfvY17g8aRCsrRFohj0EAI3M5UTQpv9s9kbX4+fMTXyYpM
 U1VToGJePuChwQ3C1TiUjZf4v1rEEejvVJyPE/RUfqiokAPk48c7jTqiHxBcTOaE9A6+
 WM4noBzKU+RcS1ggantRxKNEWqJdekzgcXzSBlNDs4wzC7+uY1ajtmfrKS3s3UXoCMA3
 fIQ2DANRxxCRmTn+HpfAUdL8zz35uNhxNQtI7kJjBHTGbJa6dvTX5B01ag1HHPLiqoI0
 e3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5ra0P0sApLBLpHS1t9jpjr+GJf+Ln6w1lcjWKImcHOA=;
 b=KSo7n+7+3HH546ujkxqtHWZhub+8iIqzA0dU8X6nDUFGpCDe3PfUq6tq3Wx2ZxV7C6
 jaSIYwvJUVaXfli3pLsC4sSMkJkbbihrKpzi++ZWGhsRuZeoNrsDmI4wuTLYkQ8dGKCS
 U14ZoQzf2sdmAts4GpGydlyEY53R+ejMc6p/jU2O/BADqSTWyNANIG6AKSIe6sF0iLte
 kZH+czV6JJKBwdWX7r6OmiOoPnuJ6cs56y6jkvPiM7H54dN56cxqtcddFvR1Md3ULYW4
 KcQZC4AvZ2zicXGwFJ/Lb/KnziC5Wb7XwpdhgvvExjt6Yn8K0SR8KnnDCOTQ4AD6qxTV
 3EvA==
X-Gm-Message-State: AHYfb5gRmd53eozdLt+jDdEd7FYN4ovSV8Gw6AQiMUK5kNCGm+X8t/tf
 Jf3g3NlrOdp+A821nyrPLjzc8jycLw==
X-Received: by 10.129.42.138 with SMTP id q132mr10972245ywq.276.1502412328345; 
 Thu, 10 Aug 2017 17:45:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 17:45:07 -0700 (PDT)
In-Reply-To: <CAPLgG=kdZt+6Nj0pbME0fAoo2YkdOU1O-W0qdpuQc3-PV0LBrQ@mail.gmail.com>
References: <CALFfRJMyenqRKq=xfhWW2O1UkQE12Xg+n_+4+Cq9HOb5zBbkpw@mail.gmail.com>
 <CAPLgG=kdZt+6Nj0pbME0fAoo2YkdOU1O-W0qdpuQc3-PV0LBrQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Aug 2017 10:15:07 +0930
X-Google-Sender-Auth: -cPMG2Wrn8YTCaI-LtZxwJMsAmA
Message-ID: <CACPK8XfbnBC4X2hf5aXzi0mKtUpu8RfixgaWnU4X=vv_ZytZjg@mail.gmail.com>
Subject: Re: Regarding SOL application in openBMC
To: Rick Altherr <raltherr@google.com>
Cc: sachin naik <sacnaik@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 11 Aug 2017 00:45:31 -0000

>
> On Aug 10, 2017 4:39 PM, "sachin naik" <sacnaik@gmail.com> wrote:
>>
>> Hi All
>>
>> Can anybody know how do I enable SOL functionality in openBMC?
>> I am using aspeed 2500 eval board.

>>
>> Thanks and regards
>> Sachin
