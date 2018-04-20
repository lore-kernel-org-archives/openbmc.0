Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40S6wZ3g7yzF1yt
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 17:31:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="fTezQMid"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 40S6wZ0mzYz9s1B;
 Fri, 20 Apr 2018 17:31:10 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1524209470; bh=8EUfTKU2Pt12Nhh+0ce41DGl/vz3IlHjQVDybih5kd8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=fTezQMidefdnVusBtcHP9qafjXkqWZv62byqQlK05siD2BZPXSL9XRKq2TUPGK0HO
 fmIZp2wOpJ4QYl+xyUZ0y//sdJ9XQ57BBVzCdb69uHv7AdAwBhI3FtDT2FMY2xqLuB
 P4AB1BY13ud6MOKhputZDGAf4l63ojWTszFIT6xOqlAeFJyYNGMclNXbW2h3jLdJeX
 E4NiskViaYnf7XvRwgwLZa6WbkgD4HYz8qg+tizW+C4/fkZ3K443b2JB/doFdAADlU
 8IzXuFjZFHWyUnsMEUsTJhpu4buzX4+QPv1emS0nkzxcaffSCS8b8W4qc6aym442cc
 yp6kD3jaBos1A==
Subject: Re: Fwd: Migration to new gerrit server is coming
To: Stewart Smith <stewart@linux.ibm.com>,
 Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CALLMt=omgN_yj6GjEaKRwWaKp4wKR++6cx3+NHixNi7YMHBm6g@mail.gmail.com>
 <CALLMt=qZkG1e2dnJm9EfVpjotq-myc5RAY2OHVxoxLNdHiYoCQ@mail.gmail.com>
 <87in8mfib1.fsf@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Openpgp: preference=signencrypt
Autocrypt: addr=jk@ozlabs.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <cf4ed490-47a2-d644-f929-1fbcddf27c2d@ozlabs.org>
Date: Fri, 20 Apr 2018 15:31:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87in8mfib1.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Apr 2018 07:31:11 -0000

Hi Stewart,

> It could quite legitimately be IBM being stupid with email (again), but
> could this be because of the migration?

I'm getting these to my non-IBM email account, with the sendgrid link
rewrite. So it's not just IBM SMTP here.

Cheers,


Jeremy
