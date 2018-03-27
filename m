Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409DM82SvzzF21G;
 Tue, 27 Mar 2018 12:44:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="gnVodgt7"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 409DM750Cfz9s1S;
 Tue, 27 Mar 2018 12:44:03 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1522115044; bh=3mpHynfmyNmwC2FwJeye1mqgJAy3Sfm0T5iOBBINzgQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gnVodgt7QWIqpszhUdmWEah78NRSVaq2EquvuymT/oNFZ2W/lpBtf2mSnAruDc5BR
 OJG4kh/STAqqFDqDhCSWS0EeOfduaV7+NNdoHbw3WMXoHOmbejW3wApPocFKGSMnk8
 VFkXrGu3sxJvZ0yo7ReubCvKlL+/03Bz1uDMEVw40kKfKNDLjxOwMHvJx+iYl9FYlF
 Ime0Wl19/JyujsNiCBAWKKXvMxNra37Wlzlh5B9ecamfnvnnBSNMCMaFce49sp693v
 5ciAJzAOOqLpMcALmEpNINkrv0aRhEr7CnVACw2blC7LeOrEzvhAudpaR8q1w7DOpO
 D+SgSMhg4npkg==
Subject: Re: [PATCH 2/5] serial: expose buf_overrun count through proc
 interface
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jiri Slaby <jslaby@suse.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-3-jk@ozlabs.org> <20180323152931.GB25972@kroah.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <c7eea27e-bf63-c083-1cfd-0c2e1b095f60@ozlabs.org>
Date: Tue, 27 Mar 2018 09:44:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180323152931.GB25972@kroah.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 01:44:04 -0000

Hi Greg,

>> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
>> index 8f3dfc8b5307..fc677534b510 100644
>> --- a/drivers/tty/serial/serial_core.c
>> +++ b/drivers/tty/serial/serial_core.c
>> @@ -1780,6 +1780,8 @@ static void uart_line_info(struct seq_file *m, struct uart_driver *drv, int i)
>>  			seq_printf(m, " brk:%d", uport->icount.brk);
>>  		if (uport->icount.overrun)
>>  			seq_printf(m, " oe:%d", uport->icount.overrun);
>> +		if (uport->icount.buf_overrun)
>> +			seq_printf(m, " bo:%d", uport->icount.buf_overrun);
> 
> Hopefully this doesn't break any tools that might want to parse this
> file :)

Given that those existing fe/pe/brk/oe fields only appear when they're
non-zero, existing parsing code needs to be tolerant of different sets
of fields being present/absent. Hopefully that means that a new field
shouldn't be too much of a surprise?

Otherwise, I'm happy to report the buf_overrun count elsewhere, if
there's a more suitable place.

Cheers,


Jeremy
