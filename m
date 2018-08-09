Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22a; helo=mail-oi0-x22a.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o3q+qzhN"; 
 dkim-atps=neutral
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mXtr2s9BzDqBy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 01:56:51 +1000 (AEST)
Received: by mail-oi0-x22a.google.com with SMTP id q11-v6so10619849oic.12
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 08:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DUl7Z6YBfG6mdMKu85RXxa5L8mK57GKEJJvYBBCjbHo=;
 b=o3q+qzhNYFItkbFtPu9xM8ReYPHpuS01fQBGXwfbex+j5kgFtC0qCOP8B3JgYxtpFB
 0Qp6mX2DmDO3pnjwjXqKBROgvDDNb0UFzhJ9KYXCCYxJm7fNOiDShzJ6yNrMdE+9e7O7
 XwgJBVEXMp6NfdGzaSdsyH4AGFRrLQJGLaRGGwKyRHFHvz/PIRp4IBF2582h0GdIh7fO
 II1eCKT4f1AGMKo73NIBar8ox6Qi1hw3NZhlVM7Vs8C4/fHaT4ObYFeq4a5AKknwYcQq
 C8WzvI4UIila9tm6ezZydbDgwNLhqemfyqCNsw9ahXxkZgJjlip3o1IP+XJ3uMcdrPHw
 G+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DUl7Z6YBfG6mdMKu85RXxa5L8mK57GKEJJvYBBCjbHo=;
 b=nWrMQzmkSpB9vnWEAT8zLazMrSFt4PbU03XlC9UyFrrzJvv6b4eMYPdpAKboIbFuj2
 usMpYCO3RBetLvOz2x3m3iRLguFhjq4bnxkO5+hf1KeYBSvW/ChslQ0vzwb3UU04wmpG
 rombbcsreC6nqDbIsLYhrJBTkSxNktcLdW7xCbQY1OeOdSQKbROIKgQ5JfP6uj+15oIS
 AiJGDZPVER9j41YfWn2Ji0rAE+k/LS3ecqkXNxg7eB/QH6Qv388zFtI2ekgw0GzYMRpS
 bVc5irlSmT67bvh0itDNrGJU5zZKIyPePQHUIHHdgHkLfTyZmNDmYmaAB2JIDlnB6qxc
 FL+Q==
X-Gm-Message-State: AOUpUlHXazTtsNmZqMgAX5NAxJBkVXxNk8ZIpjL4+dhLo0lh0V6kiyFN
 s/9aeLSJVNFdT5LyBIC4yhyOp1G+
X-Google-Smtp-Source: AA+uWPwLDwzTtbbh84F8hElP6I8jHHly+sfZse4AE0W0E8nsVaCrySpJ26IWvaensWOxQUWV59NDyQ==
X-Received: by 2002:aca:d609:: with SMTP id
 n9-v6mr2480837oig.357.1533830209655; 
 Thu, 09 Aug 2018 08:56:49 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id n15-v6sm3506518oic.33.2018.08.09.08.56.49
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Aug 2018 08:56:49 -0700 (PDT)
Subject: Re: Test work group webex link https://ibm.webex.com/meet/sivas.srr
To: openbmc@lists.ozlabs.org
References: <OFD3EFB74B.E022AD9D-ON002582E4.004DA942-002582E4.004DAE05@LocalDomain>
 <OF036ED67A.C69EBF5A-ON002582E4.004DC8C7-002582E4.004DC8CA@notes.na.collabserv.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <b1b642db-c6fe-9c37-5c26-1ceb1aeb994d@gmail.com>
Date: Thu, 9 Aug 2018 10:56:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <OF036ED67A.C69EBF5A-ON002582E4.004DC8C7-002582E4.004DC8CA@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2018 15:56:53 -0000

On 8/9/18 9:09 AM, Sivas Srr wrote:
> https://ibm.webex.com/meet/sivas.srr
> It is updated in the test workgroup wiki.

I understand that the meeting was 9:00 Central today? I would have like 
to have attended. Maybe you could send an email reminder or update the 
wiki with the day/time for the next meeting?

Thanks!

Kurt Taylor (krtaylor)
