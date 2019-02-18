Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nZnbBVHd"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4436gV6HwRzDqHW
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 02:08:06 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id t7so12361701otk.8
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 07:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Od4OvwX9EQlIMtSyZZ5BpJwUpzuC2/A+z+/KjtZn5Lw=;
 b=nZnbBVHd0AhSl8z2Kys5ZzpAeUUEjdt1S17zjetbxwmzIL1W7zaD33I3ams6lp7iu/
 IlfHoysbFT9PMnCupx7Tk3Qh2iBZOl16++LGDYqjtdZ3hhgFqDds4k2byYU1Ylu+7KJO
 tqPeiACOWTV539KcATbqV0faRtp/C+5WI5n2Zg/UNK+c8/j/fO3x2Bjb/ytsZohTv7KB
 l+bznaPgEIe+fWi3rP7HHNvNDSVmHUax7rYRpXOQIjgDhaACrguBH3C2C/MBuZpsHnN9
 vnotjGWd/+T5nHr7oD3CEA+WgfrJLr1J347RuUK2djxHQBjjyd64ioV47+ZhOzcDn0GV
 yNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Od4OvwX9EQlIMtSyZZ5BpJwUpzuC2/A+z+/KjtZn5Lw=;
 b=lYUy5FaC/9A7BJCm7JgKgC2/S2ALdhmvXZE2RzzKTUWVz7hohcdumhHYybeUEA3eFn
 ZCgSR3bEr+NXghVi0DthSiCWGrtbx1vZvlVVyHuSL+k7rq2GFdM7q9CZEusaSOrHLgBR
 Fj7aAwnsVNvkJRWGKnAq1WuWMFV126I4DHY97IjjT563m+ScQFw4WlPqZzqXZNzXG+pt
 /TwwAU7qP4A/w2HMPGYYqf87wTEu/frXZ3Wr5dm66fl8o4/77DteZTO6/kR8iNSLt6JK
 7vTB/rQTZNxezlYJ6fzr5pVooEkKlZUtl9k3ufs4PrzwecM2dR1KC5kx5XsUgNMOC1M1
 erzg==
X-Gm-Message-State: AHQUAuaPcnAGNmtO0HOsIg7IS525AcGIyJ5LPj9xEmiiiTELVguIUBez
 26w7PqDOU1O6dog4Oj4IDNlAM9ud
X-Google-Smtp-Source: AHgI3IZ3JwcqgXMarDRpYTWOfT42d5SuFGeEl9XI/kO1Ud6C1q1RXzJMgvn54SCbL5wdO01jUVydqg==
X-Received: by 2002:aca:6cc9:: with SMTP id
 h192mr15211593oic.161.1550502484017; 
 Mon, 18 Feb 2019 07:08:04 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id v2sm1623214otk.60.2019.02.18.07.08.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Feb 2019 07:08:03 -0800 (PST)
Subject: Re: 2.6 Release announcement - doc versioning
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: openbmc@lists.ozlabs.org
References: <06f35a3e-2d73-f973-8a45-fd38282fd1ed@gmail.com>
 <1b0f40f7d9a1729eca21d4c655476895@linux.vnet.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <d2cbfd95-b1c3-37fd-b100-aa2d57dfca58@gmail.com>
Date: Mon, 18 Feb 2019 09:08:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1b0f40f7d9a1729eca21d4c655476895@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 18 Feb 2019 15:08:07 -0000

On 2/16/19 12:30 PM, Joseph Reynolds wrote:
> On 2019-02-15 12:44, krtaylor wrote:
>> I have not been successful (yet) in trying to get access to our
>> openbmc.org website for adding things like announcements. So, I
>> created a quick release announcement on my personal blog to spread the
>> great news about all the hard work that went into this release!
> 
> Thanks Kurt.  It looks great!
> 
> I got a question from someone who was looking for docs for the 2.6.0 
> release and for the earlier v2.3 release.  They went to the 
> [REST-cheatsheet][] and found guidance which had already been updated 
> for the planned 2.7 release.  So they were confused and frustrated 
> because this interface had an incompatible change (to its authentication 
> method).  I pointed them into the document history.
> 
> Going forward, what is the plan for documentation versioning?  We should 
> have a way for someone to get the documentation for a specific release 
> level, for example, to get the docs that apply to the 2.6.0 release. 
> This will become more important as we add new features and make 
> incompatible changes to existing interfaces.  Should the openbmc/docs 
> repository have the same branching or tagging as the other openbmc 
> repos?  Then someone can just checkout that version.

Yes, understood. And, I like the tagging solution. The only other thing 
I could think of would be a point-in-time tarball when we tag the 
release, but that seems much less efficient, and we then have to store 
those tarballs somewhere.

I'd ping Brad in IRC and see if we can discuss it there.

Kurt Taylor (krtaylor)
