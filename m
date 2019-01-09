Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JrpQsQrO"; 
 dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZbXM3Y7FzDqXW
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 04:21:55 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id e12so7370710otl.5
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 09:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=8XeZ1sQWgDu5esXEqx5IjHQJ//0yeFz6CY3oTd361Bs=;
 b=JrpQsQrORjBc3lMmPaTQAqB8Yl84kc7Xf+qy/bRJW05WQKIfRabCm5EWZt4qQC057a
 +Q47+Ld5x3haw7Iu94+5EzrXaIQu8cex/Rid4+Qoc/SnQDKabdlfHbFWb4aF0cJEaTDG
 cO31QUlWa9HtfLakwJaYbfv8pzN30pZ49MwBEHSRfd8c1O5xJQtn2N9PCQXUVkqdATqV
 TNvkp/Vogpl18EiMTa3s9jNGBNUulJ8Kps55H/FbPcf8tke+l5O4e9iGg4p0IujlHW5I
 YZz5ac7B5G/RBTapn1fr0b55MVrxhreF6Wc+jxUOvTCgF0qEV2F0xJKZTVGKpJDWSne6
 pq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8XeZ1sQWgDu5esXEqx5IjHQJ//0yeFz6CY3oTd361Bs=;
 b=InZqSmvvQTBjVIWPOUyGMG+kCYETW0qu0CfbnVUHqlfWJ0URq6Xp9hPaFZROaPRtAz
 MrJIz0aluxwyB5dhK6h2LTk8ZjntXTxALkDg29NtDJShTPa63F91gDTBH8D0yTYldPCS
 jggCWVBZffWhymM26K1kthpbj+XNYjOy5ncc1DnX1YJ5Sco7qIULHrmV/pN2ZC5FKvF+
 UUWXCSV0BOr0fS77RAap7aDV8ksDL5e/a9xwpW3JaA98LV+LmUwKADswmi0jRuZt3Tpu
 edOeyLt8csDghWAsaMQC3Sqgwv03ZORw5Bms36WTP/pD8mdTNGzMMbu6i8BzBPE8m2WE
 OFCQ==
X-Gm-Message-State: AJcUukfrUoXgdMQBYaUzEM+8zejgKFA9DaFPqWdH+Zb9KAOJVKbkl84P
 IHvwDDTq0mEG7bmz6g2pwOM=
X-Google-Smtp-Source: ALg8bN7IFMTbhBFI15QWlVCC/JXjApGRzaUcG43yl2r9tamAMh3xx1hjt8/V/7DRfiD5VcRI8Z1BZA==
X-Received: by 2002:a9d:3a0a:: with SMTP id j10mr4525321otc.229.1547054513290; 
 Wed, 09 Jan 2019 09:21:53 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id h25sm35280996otj.27.2019.01.09.09.21.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jan 2019 09:21:52 -0800 (PST)
Subject: Re: FW: Signed OpenBMC CCLA from Mellanox Technologies
To: openbmc@lists.ozlabs.org, dthompson@mellanox.com
References: <VI1PR0502MB3869C054EBFA3EA4812643F2DD8C0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
 <VI1PR0502MB3869B3676998724C2418E21FDD8A0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <5a648457-bc40-c0ac-f019-514d5d17aefc@gmail.com>
Date: Wed, 9 Jan 2019 11:21:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <VI1PR0502MB3869B3676998724C2418E21FDD8A0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Wed, 09 Jan 2019 17:21:56 -0000

On 1/8/19 7:58 AM, David Thompson wrote:
> I have yet to receive a response from manager@lfprojects.org 
> <mailto:manager@lfprojects.org>
> 
> Forwarding to OpenBMC email list for your approval.
> 
> Please let me know if you need any more information.
> 
>   * David

Hi David, The LF Manager forwarded to me. I accepted the Mellanox CCLA 
and replied to you via email yesterday morning. Welcome!

Kurt Taylor (krtaylor)

> 
> *From:* David Thompson
> *Sent:* Wednesday, January 2, 2019 2:07 PM
> *To:* manager@lfprojects.org
> *Subject:* Signed OpenBMC CCLA from Mellanox Technologies
> 
> Please find attached the signed CCLA from Mellanox Technologies for your 
> approval.
> 
> Thanks,
> 
> David
> 
> David Thompson
> 
> Sr. Staff Engineer, System SW
> 
> Mellanox Technologies
> 
> 1900 West Park Drive, Suite 290
> 
> Westborough MA USA 01581
> 
