Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L2A2yA4/"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VcLv518BzF1Pp
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 01:44:39 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id i12-v6so5610347otl.1
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r8F715hIxdJtvoSNnEKjhzN5N8WbV1TukL6CqmbtUMs=;
 b=L2A2yA4/3nKWJxjspE7vDNU02UGd0ec/rVgML8as4sLjWqpqg81iv9IEibtEGXD3lC
 bfMblEVJke37aZGJL0b9Y0BhyrSV6+pTivBZtwbf/BffMtWi6AgQCzFemiLKrIjbWbvn
 nhxsWKQu32TiFEGJcTpEIRDTHH+/ypYO9Be/BMpS0RRAgODkpPX262zahb4CZuKg6j3e
 JQPMidN/bUS4LUo0U1CuWNrDnCzEg6fg4pNIS5M8/G23FCkrYNjyx08+C2kKTF0tXVCS
 emllq3mp9MoynnGwLG/0Hwr9Z3IyK15L2xcDZxtZAUV0r94+U6+FWBSoA7y89JCOzN0t
 kdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r8F715hIxdJtvoSNnEKjhzN5N8WbV1TukL6CqmbtUMs=;
 b=jDC8pioBaENks8PUqWRitAEK1iNAyzK47TyxYylOzZ9GPC7bj6CoxCuREQo936AnHn
 Mg5kG9vpkStH00VLTyZC46/yzuQ8YF6Zb3BTEV6+8PkCs+9ezAHWdC5IsaVzbV/qo0L3
 zNBmKRVgg8Vc83Iz6fZ3mSqQtlfjQpGbvshfnf3u5HuD4KNOYWb6roJ+05xpeysRPMko
 Iep12OOjNKG++zmnt9Oe7DxkfWQxwFXpgAkTH+CFxgNtEiznfQbZq7VyuBEYFGQv3kbL
 ZplMUyXBA6HnKnyUljYAZfqN9hi2uloiVoSYMSBxCQqEF6NMWY1RLE/5A5ABTDJ8+/DN
 0FFw==
X-Gm-Message-State: ABuFfogC+hRWhIIuiuT6SOFSBKIFtWloSHdyfWEowoZPfE7pOlILTgAj
 SScpGLAQq1nDcPn1UJaYdN1eH0fQ
X-Google-Smtp-Source: ACcGV63ZTTd6VlgObeTWV1hpaZRjwJCioam+HJM1Bz30Qk/nnryGX0ZJOGOlCgT9f5lFEw/W+oFaCg==
X-Received: by 2002:a9d:1d47:: with SMTP id m65mr21451151otm.199.1539182676919; 
 Wed, 10 Oct 2018 07:44:36 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id w1-v6sm7250085oif.1.2018.10.10.07.44.36
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Oct 2018 07:44:36 -0700 (PDT)
Subject: Re: Community Code of Conduct
To: openbmc@lists.ozlabs.org
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <e39576a0-08f6-bc6e-d36b-a297328e0c63@gmail.com>
Date: Wed, 10 Oct 2018 09:44:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
X-List-Received-Date: Wed, 10 Oct 2018 14:44:40 -0000

On 10/9/18 1:27 PM, Emily Shaffer wrote:
> Hi all,
> 
> As I briefly mentioned at the end of Brad's presentation today, I'd like 
> to propose adding and enforcing a code of conduct for us to follow.
> 
> For now, I am planning to grab a copy of the Linux CoC and put it up for 
> review in /docs. If anybody has a different CoC source to suggest, I'd 
> be happy to discuss.

We have a CoC covered in the OpenBMC Charter under the LF policies. We 
can, of course over-ride that one and propose our own.

See: 
https://www.openbmc.org/wp-content/uploads/sites/62/2018/03/charter_openbmc_02142018.pdf 
(4.b. "Compliance with Policies")

It points to the one here:
https://lfprojects.org/policies/code-of-conduct/

> Brad asked me whether I had seen an issue so far and I had not, so 
> please don't take this email as some kind of retaliation - it's not. I 
> think we've got a great, positive community and as we grow I'd like to 
> preserve that culture, and the code of conduct is a great way to do so.

I couldn't agree more!

Kurt Taylor (krtaylor)
