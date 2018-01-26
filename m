Return-Path: <a.amelkin@yadro.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="GVBvrMd4"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSbhz0lQGzF0Pr
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 22:07:30 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5170851A65
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1516964846; x=1518779247; bh=N3c
 4BQkxqKN+4EPLfOtaM5tM+UCXxXHn2UGbwdx2284=; b=GVBvrMd4KoLvkXNQXW9
 8nbMKBi80ubwagNAEKu18HCZcIo6VUUh4F/oZJp1Ir7gVzA6/3o0rkzCVVNhsVY1
 A//6i9sSN2duYuC5w6FgKIuTCR83wJiVJvbcdhiOWxOf4gPcUODEufu9TXW3HH1B
 Zu6SZ33qCpbxkoE9ucRUvnGI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jRuzQUTlFWb for <openbmc@lists.ozlabs.org>;
 Fri, 26 Jan 2018 14:07:26 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6509451A5E
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:07:26 +0300 (MSK)
Received: from [172.17.14.148] (172.17.14.148) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 26
 Jan 2018 14:07:25 +0300
Subject: Re: BMC Image Signing Proposal
To: <openbmc@lists.ozlabs.org>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
Date: Fri, 26 Jan 2018 14:07:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.17.14.148]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 11:07:32 -0000

Hi, Anoo!

The thoughts are as follows:

1. BMC usually runs in a secured environment where probability of 
tampering with flash IC contents by means other than BMC's firmware 
itself is negligible.

2. U-Boot already performs image checksum validation before booting a 
FIT image

3. User input really needs validation, at least to make the system 
fool-proof

Having said that, I suggest that the only thing that really needs doing 
is signing (and checking) of the overall firmware image file that is 
supplied by the user (admin) during the firmware upgrade procedure. 
Applying asymmetric cryptography to a digest hash looks to me like a 
good idea as it indeed allows for verifying the supplier of the firmware 
image.

Regards,
Alexander Amelkin
YADRO

26.01.2018 00:15, anoo wrote:
> Hi all,
>
> During the hackaton meetup, we touched on BMC image verification and 
> signing and concluded that the community would like to see two 
> verification steps, one prior to writing the image to flash (via 
> digital signature verification), and another one by checking FIT in 
> U-Boot prior to booting from the new image.
>
> The proposal would be to implement the digital signature verification 
> first.
>
> At a high level, during the build:
> * A SHA-256 hash would be calculated over tbd files that make up the 
> firmware image.
> * The hash would be signed by a private key that's part of the 
> repository (community key). Companies could overwrite it with their 
> own private key when building production images.
> * The encrypted hash (digital signature) and corresponding public key 
> would be added to the firmware image.
> * Yocto may already provide a way to sign images and generate keys.
>
> On the BMC:
> * The hash would be calculated on the image files that were uploaded 
> to the BMC.
> * The signature would be decrypted using an existing public key on the 
> BMC (this validates the new public key delivered with the image is 
> also valid).
> * Accept image if both values are the same.
>
> Any thoughts or comments?
>
