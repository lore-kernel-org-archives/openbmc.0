Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sAm+d52U"; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xSPj3WM3zF3ln
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 06:06:17 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id s22so5986849ioc.8
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 11:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:references:to:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6IaJBdNje0QcIbC6nfLpnLBnKenePpJ7uZb5EokWgQ4=;
 b=sAm+d52UteV6h7ST6Jc0BJQpoYpTr/oUkno4hXuOT4UG47t+HxcjDphCcUwVhMPYRd
 rdycunxZHc4gp4MClBTboLo6PvSeaMRLX+MbZ74iAS1k0ZFgxmowH5DKqDK8zqFjHuEW
 QaZX1f1cJcnJshT5kK/CI5jglbSw/c41cFv5V6Q4EObhV0soSzIT8CkPjbQEyifrtrfU
 WHCq2luxB7tn1erKeQ9FDREAmqhFjxSspSndk0iUMR6dAItOZyRf5IZBY7STvPkoIcp/
 v0TtVLahRjAPYhe8tJmzgzVoevCatb0kphuojzrMLDX3ejF+OMx+kp9Ozby7N+YS1fXR
 qCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:to:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6IaJBdNje0QcIbC6nfLpnLBnKenePpJ7uZb5EokWgQ4=;
 b=bFe8EeEanIZ4e9Px9xYLEcUhu+A53ZSVl0EowI2eYqdUr1jb+kRckwu0K01luhW9TY
 iKRPm98J+Kt5wYBcH6R3v8aJbG7qDOxmTzwa1ZSKunOWfOvbacQKEt1hj44mrqCWchmC
 F/UjHQl3W0Of1c80Sg1Vj2qL0sbOyxpFWY9HiJd9hoRnzWLr7JayduP5r6KVql6aDymV
 RFN4/vM/lBoCpr2ee6+BNJeAu1HCeWnXLYuGXVXzmW/jP3QwFpFq4sjUATf49BEJUaYN
 hQbwz8Sq/cT8o1wSON5W8myEhRTL9zU5nVVfV7N+v4O0u6UqB5OAqp3ZNw9leG4axONA
 q0VA==
X-Gm-Message-State: AGRZ1gJlj8SPJ8nl0peBVeXbQNXl+Fo2BtxxkBB6gAlpWcLoHK0Pospj
 1GHlUCLZfE+qclL/ETpsQzM2X+/0
X-Google-Smtp-Source: AJdET5cvK11gqvE6FHkLECmPo5+K2hq9v39Ul6g55BCb1+COGa6FxlwZyvjLVnzwYdDlKmFdc6iF/Q==
X-Received: by 2002:a5e:d510:: with SMTP id
 e16-v6mr10789426iom.291.1542395174473; 
 Fri, 16 Nov 2018 11:06:14 -0800 (PST)
Received: from krtaylors-mbp.austin.ibm.com ([2620:1f7:8b5:2842::32:1e])
 by smtp.gmail.com with ESMTPSA id f137-v6sm530493itc.0.2018.11.16.11.06.13
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Nov 2018 11:06:13 -0800 (PST)
Subject: Re: Next Release Planning WG meeting Nov 19th
References: <fd50ebf0-caf5-7ade-9616-7c319b7ade54@gmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <a7e9c72f-850f-36ba-9b4a-17b4acd2d445@gmail.com>
Date: Fri, 16 Nov 2018 13:06:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <fd50ebf0-caf5-7ade-9616-7c319b7ade54@gmail.com>
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
X-List-Received-Date: Fri, 16 Nov 2018 19:06:18 -0000

On 11/12/18 2:13 PM, krtaylor wrote:
> Following the lead of the Community call this morning - anyone object to 
> canceling the Release Planning WG meeting next Monday (the week of 
> Thanksgiving US Holiday)?
> 
> Please let me know if you'd like to before Wednesday, else I'll cancel.

Done - no Release Planning meeting Monday Nov 19th - see everyone on Dec 
3rd. Have a great Thanksgiving!

Kurt Taylor (krtaylor)
