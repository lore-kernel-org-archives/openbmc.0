Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TaY3cD+S"; 
 dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Vcg510KczF1Pw
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 01:58:41 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id l58so5646703otd.6
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pNLVOg2Y8a/DoCFpOWKMtXObg/whYqP1cqe9/rQdwxg=;
 b=TaY3cD+SoJoRPOQ4PrgUkXa6RG30tP5L66dPvntMMM+G7mDoBQCChc2T9QAyBfKzQc
 +aKmYpBWD9auZHU8SSypdGk1+x/bh98kGLiMKX5rRdhHdtjbsI1iqGngqqpFKaJvTnyr
 SBlsI+K0jeRbepedI593NLAwAPlzfA8pAsDa9c3QO8/rNjkRdxxQgTgKuMpWYHF/v7Qx
 7XKmJ1WBcAoBl8YpvdxiUPd3qNfqaSKquRrrZN4XncjgiOb83AvWkEWkAjnQqlHUDYN+
 VtKu000AhumW3zfzX34b8D/mFhT68TwXfdhKpSZN7FGII6O8p9HYcAXjZjAZDFm94v7i
 FPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pNLVOg2Y8a/DoCFpOWKMtXObg/whYqP1cqe9/rQdwxg=;
 b=kV64MRyh1jwjzf8nOqsahJGYzdm8Tp9EnRc9K/0R0ujTAu537U2hjG1pt9suoMpeO7
 vNyPEgv9h+EyaFPV3GFE922anUh9C1bVEijOCCphU5nYn09eLCYA7Gfip3Ao15sgNoAB
 PQgU2jhbJMC3pG+qALJCxClh5zju4EsAVkNM2q5Nhngn+ZIUX40UcIdT+aXoaWDS1h7p
 HrHVdXIvnxZQOh/6axs8khhxwJ8j+gtTQi/mqwt0uoTA8SGvVsVlpLVVO0EcRQaL8DwO
 k38vprvqfJIYAm/2hw8Xfgk74qU5JPypsxFeGq/juB3qGMKk8hauW+w00XOfwXYkpS5Z
 zqfQ==
X-Gm-Message-State: ABuFfoiEAumwV100MYHVv5KxSfhYktVFsCP/tDRd0lRQj61vxv/6qBLv
 O3dHUOHjYKa1F1WJrWVWgS6c6l7r
X-Google-Smtp-Source: ACcGV63hR5+wcjVRKUItAKmURomD3NsrtSiE5lbA9KhJruVxFYaWqHnEjvpDYZrmh3NSTssAzZAOWA==
X-Received: by 2002:a9d:4d0a:: with SMTP id n10mr18918037otf.95.1539183518596; 
 Wed, 10 Oct 2018 07:58:38 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id s83-v6sm2227041oia.9.2018.10.10.07.58.37
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Oct 2018 07:58:38 -0700 (PDT)
Subject: Re: Community Code of Conduct
To: openbmc@lists.ozlabs.org
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
 <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <481b4ab3-8ecb-769c-5d23-25242ad394e5@gmail.com>
Date: Wed, 10 Oct 2018 09:58:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 14:58:42 -0000

On 10/9/18 1:53 PM, Emily Shaffer wrote:
> Reading through this, I've got a couple concerns:
> 
> - There's a clause for enforcement. How do we want to assign ownership 
> when enforcement is needed? We probably want to lay it out, I'm not sure 
> that it should come through the TSC. Maybe Kurt would be a good start as 
> the community manager? No offense to Kurt but I'd also like an 
> escalation path or alternative path - with these kinds of things it's 
> important to be able to bypass an individual if necessary.

Re: Community Manager, I am already partially doing that in an 
unofficial sense, but for an escalation path, I would highly recommend 
first reaching out to the TSC. Any inappropriate activity or harassment 
must be taken care of immediately and the community leadership would be 
tasked to take care of that.

> 
> - The clause on scope seems to me like it may leave a gap surrounding 
> harassment of community members outside of the official OpenBMC setting 
> - ie, Foo posts to their Twitter account, "I'm having a lot of trouble 
> with Bar's code reviews. What an idiot! Tell them so - their email is 
> bar@baz.org <mailto:bar@baz.org>!" I'm not sure I'm seeing how the 
> contributor covenant protects against this kind of behavior. Maybe I'm 
> just misreading and this counts as "prviate communication"?

This would absolutely require that the person be put on notice. Maybe it 
will help, but I have also never seen this behavior work for anyone 
trying to harass anyone. It has always backfired on the person doing the 
harassing in every case I can think of (I have been involved in a couple).

> 
> On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon <jefro.net@gmail.com 
> <mailto:jefro.net@gmail.com>> wrote:
> 
>     Hi folks
> 
>     We strongly recommend the contributor covenant coc. Being adopted by
>     many projects.
> 
>     https://www.contributor-covenant.org/version/1/4/code-of-conduct
> 
>     Glad to discuss more

As I said in my previous email, we already have a CoC under the LF 
policies, but I am not opposed to adopting a new one. That said, do we 
need to improve the existing one? Is there something missing? Has anyone 
compared the two? Did I just sign up to do that?  :)

Kurt Taylor (krtaylor)
