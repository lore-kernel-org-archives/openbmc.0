Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hilmcTtB"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z2Nl06MJzDq78
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 10:41:10 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id n71so1271480ota.10
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 15:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7+J+zFlmdxYeHKZVeEGntkOjkGwDNTscUfWaQPGpAwU=;
 b=hilmcTtB254qDsn77WJ5tuJ1GMjaA6C7eLVL5kdrgI3k5aXcGKD0FAH2gZltkAyu/4
 CgMhAHYlPdqa9Kr0Ehe6dgBRPxCf2N1hnboR9tZXIqWp2nZEZU/VT25hRP9EeN0HDwfq
 jyNKerNFrYVRR9o6i65B09EzNVPbrNEH7TQjGqg+hprw8Bn/lGnhZpHVVC7sdo7N8Kj8
 I6bBlg3Xwobje6ch9i4ccrJf/1EGHqWdxjWAlHFFJevWqbCmjPEFwlhBwX51YWX61mWT
 rwUoj3EBNiUyI6X9hydCGoxWJab2msjRoBrgr69U3thmiA2pkHfgegWfJRnOjhjYKFRX
 6Ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+J+zFlmdxYeHKZVeEGntkOjkGwDNTscUfWaQPGpAwU=;
 b=CtmCpkvlmZxCVqyLkrcef7sDRu4XeZHxl0gAJETmRcfoPZBugxSGi15JtZaVzdGI1x
 h9UNVJRnpKbKQcx8M7EJVNIDuoH60YAf0SasFy6vWCtCBQOfy3FouK2pUcIIpzkO6WoJ
 n5imY3iV5w0N9t2UC/79oWAYBdhx2vhK0HZp8AsWxvcohJ6K0hN6aLaNDZrho+InUBMu
 vD8J7qSTv3hoD7kWkPv/IkAG3j/TCxOSiMmM0+5dWlsw6hvG2s45Ey6kdnxNu4pyi7Xy
 FqsdS/qTfdmqnUKfhUs4zbl6+clKGDwPiNedmRlvjldxzEXvNd7idOAoBkudF6T4mY7c
 N35A==
X-Gm-Message-State: AHQUAua7jclSfCRfNm9wh06pYlg6M4bzXcGYn3844Bgn6RVh3ISrpov+
 hHe6JPQuOLG/HvptMcMQF7autFU6
X-Google-Smtp-Source: AHgI3Ia78uB1IoPQShvFaFx+s5QOTydHsBrtH3ACa1HGQnLZUF5gUL10oKRSATTXiJCkutYspywOww==
X-Received: by 2002:a9d:4e08:: with SMTP id p8mr768921otf.116.1549928467997;
 Mon, 11 Feb 2019 15:41:07 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id d3sm5128774otb.79.2019.02.11.15.41.07
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 15:41:07 -0800 (PST)
Subject: Re: Using Stale bot to clean up issues
To: openbmc@lists.ozlabs.org
References: <01b53196-6c78-b004-8cd0-8534c516cbaf@linux.vnet.ibm.com>
 <df81f451-6982-6fd8-8acd-ab24b8f4c88f@intel.com>
 <5f203acc-f41d-cbae-1b1d-4c0af9d51b6e@linux.vnet.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <9384d805-8ce2-a3b9-4406-06cf4f775306@gmail.com>
Date: Mon, 11 Feb 2019 17:41:06 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <5f203acc-f41d-cbae-1b1d-4c0af9d51b6e@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 23:41:12 -0000

On 2/8/19 6:23 PM, GUNNAR MILLS wrote:
> 
> On 2/7/2019 5:13 PM, Ed Tanous wrote:
>> Have we looked at what a majority of our issues are getting stale from?
> 
> 
> Just in  openbmc/openbmc there is 467 issues. 281 are older than a year 
> and 78 are older than 2 years.
> Some of them are a lack of feedback from the submitter. A pretty large 
> percentage I don’t know if they are still an issue.

Maybe what we need is a fix it week! Oh yeah, we have tried that. :) But 
seriously, maybe just old issue review is good enough for now? 
Priorities can change (increase) over time and some old forgotten issues 
my be important enough to fix now, or may add an important twist for a 
new design.

I understand the desire to keep it open due to lack of resources for 
fixing it, but a year? 2 years? Yeah, let's close 'em.

> I feel this many issues is unmanageable. From the stale bot README:
> "In the experience of the maintainers of this app—and the hundreds of 
> other projects and organizations that use it—focusing on issues that are 
> actively affecting humans is an effective method for prioritizing work.
>
> To some, a robot trying to close stale issues may seem inhospitable or 
> offensive to contributors. But the alternative is to disrespect them by 
> setting false expectations and implicitly ignoring their work. This app 
> makes it explicit: if work is not progressing, then it's stale. A 
> comment is all it takes to keep the conversation alive."

As long as the issue is closed and not deleted. I just want someone to 
be able to find an issue and reopen it, and retain all the previous 
discussion history. Of course, that assumes that someone will search 
closed issues before opening a new one, but still.

> 
> I feel strongly we should do something like this to manage our issues.

SGTM.

Where are you planning on hosting it?

Kurt Taylor (krtaylor)
