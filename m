Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::131; helo=mail-it1-x131.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ee5CDT86"; 
 dkim-atps=neutral
Received: from mail-it1-x131.google.com (mail-it1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fxS32KYXzDqhR
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 06:03:14 +1100 (AEDT)
Received: by mail-it1-x131.google.com with SMTP id h65so4233330ith.3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 11:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=fOkUvXexbbHvqsLNoEuZRIa37410l2k+vOmtTHSEZgI=;
 b=ee5CDT868Wtb6j1UNGwRFgaWJ0LjycN88ornUJ71c5cXYxWl9wg3VmxXQ22KAQvu6w
 OfqeLLzDj+B8DDRwPxIlyL9muX0O6QlzfTvbDN/47ifTjDA8Vyi3+JFOk7BJG4KGTcDZ
 PPmt1o9io2M8SqJDjZsSoA04uSpL6ORXBXhLgraMUE9C9J9BO+iQXE9GJU3VODvDJfvY
 VeVvE+5Nr6AMAUxQORLV7IsiiN0nNYyrcaddJPSYjm7NPjRj4cmNF2ri/VjWlszY/gRB
 EXgWhsEZ60EeuIiXH2AMmEceorC64mPVM21hngM36alYkPHuqTONSDiJYe0gM+FZfMYE
 Z4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=fOkUvXexbbHvqsLNoEuZRIa37410l2k+vOmtTHSEZgI=;
 b=mnKQUPvGQDL+jUfD2yZHUhdDLbZhJk1HJ0yJy9Tz86/cSY4XTRVDdf4VNAFi39niSX
 3dnihipn9/PkW7YBiOZmRH6eWj+XvVXBzxJZdisqfn2ZE+WoNDjwOTbCXxNmO72f4yZS
 2w6YmrONNTTmv1xvxnmAdQCf7Rzm1TiJ1oZuRXbG1JL4yOh1v6L+wPWB0WkXWoBLitlH
 IKycrfplNyTWZtGJxJYq0MHkWGy1GTMFkhkNldekGw9t62unNJLjbUW3ssxraYnAJXgw
 5JWPWwSLt8R2xruc9Q4SZT0iPORIOq4l+E2l8lN8vCKqb+ov4V3B9NNcYwnWMVijACXB
 iFTg==
X-Gm-Message-State: AJcUukelLgVcL4reAensNR8slASvHCgDXgMdxy+1AZJ/8TRpfzbMUwGw
 sDvhA6whVDMucFw/xQQx/xjIbzDn
X-Google-Smtp-Source: ALg8bN5SQw5sj8R+GLhfyFSYpl16qIMp1blJGgjzZv5IhMArMIeI8QB2x3LyrqC1u13LgkCwncdRTQ==
X-Received: by 2002:a24:7609:: with SMTP id z9mr7073092itb.66.1547665392478;
 Wed, 16 Jan 2019 11:03:12 -0800 (PST)
Received: from krtaylors-mbp.austin.ibm.com ([2620:1f7:8b5:2842::31:7e])
 by smtp.gmail.com with ESMTPSA id f13sm2710514iol.82.2019.01.16.11.03.11
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jan 2019 11:03:11 -0800 (PST)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: 2.6 release notes - content?
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <76efefd3-5fa1-0274-59da-9908858d9b98@gmail.com>
Date: Wed, 16 Jan 2019 13:03:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 16 Jan 2019 19:03:16 -0000

At the last release planning meeting I asked for volunteers to write the 
2.6 release notes...and instead I got volunteered. So, I'll have a go at 
it, but I need your help.

I am going to start with the content in the spreadsheet, so I need the 
release planning reps to ensure that it is current ASAP.

https://docs.google.com/spreadsheets/d/1lts-YX8J_AnS2dKfhW649OQHijz-JRiJWHTDpKY62Hk/edit?usp=sharing

We'll be excluding those features that were not completed. I also need 
to include *significant* functionality that was contributed, but not 
listed in the spreadsheet.

For new content, I need a couple of sentences that describe the feature 
and the benefit, as well as special considerations, configuration, 
limitations, etc. Anything more than a couple of paragraphs needs to be 
documented in the feature/repo readme or in docs.

I am not trying to write the perfect release notes. We can improve the 
process and quality for 2.7.

So, please check with the spreadsheet, make sure it is current and reply 
here with content pointers or any spreadsheet omissions.

Thanks everyone!
Kurt (krtaylor)
