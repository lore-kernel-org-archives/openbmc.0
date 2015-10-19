Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x230.google.com (mail-pa0-x230.google.com
 [IPv6:2607:f8b0:400e:c03::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 052431A03A1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 13:06:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=BbIXsAfN; 
 dkim-atps=neutral
Received: by padhk11 with SMTP id hk11so13527836pad.1
 for <openbmc@lists.ozlabs.org>; Sun, 18 Oct 2015 19:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding;
 bh=a3ySHK3la8q89yNonjgKQrUP/GHKZb/Oc+/9Ux7ON54=;
 b=BbIXsAfNFgdQ+Vw8Nezdt4kq/TFqRxWSAnHwBi2Bz4hKdR0dGLLIxVs6elzdEbI+Py
 if+O9jGUg2CZFfYea+TWwhlMttCuFU1EP4TbZ9NUcpQI8P9cEw5IkaZkiqsLviVnbRdF
 /ZU+GPB5SuFbj11IrfpivCaWyA3+2giW18Yvvq4eym9l28QjgxHAArgMQiMqvvAv+9y7
 Rp+WoBhlvVAIzAdsKoYLT/WVDFGxB69K2RlyB2TNyfzDbfZdBFOncbiiuWF5kz13iMbn
 kwnAsBB7Zc8yvwvTD3jtzlVFFhHidMu7M+Qj1TDXzSrfrcwI1nFhtMDn6FxckI3M4oQy
 kMXQ==
X-Received: by 10.68.91.193 with SMTP id cg1mr31475586pbb.98.1445220398309;
 Sun, 18 Oct 2015 19:06:38 -0700 (PDT)
Received: from icarus (ip9.cor1.adl1.base64.com.au. [203.0.153.9])
 by smtp.gmail.com with ESMTPSA id w9sm33031710pbt.29.2015.10.18.19.06.29
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Oct 2015 19:06:31 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1445220386.17366.1.camel@jms.id.au>
Subject: Re: copying on to BMCs will never be the same!
From: Joel Stanley <joel@jms.id.au>
To: austenc@us.ibm.com
Cc: openbmc@lists.ozlabs.org
Date: Mon, 19 Oct 2015 12:36:26 +1030
In-Reply-To: <201510161914.t9GJEGCV012861@d01av04.pok.ibm.com>
References: <201510161914.t9GJEGCV012861@d01av04.pok.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.16.5-1ubuntu2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Oct 2015 02:06:41 -0000

On Fri, 2015-10-16 at 19:14 +0000, austenc@us.ibm.com wrote:
>  
> Having to enter a password is sooo 1999.  This expect script will
> take a series of source/destinations and copy them on to a system. 
> This is useful when you need to copy files to various directories. 

Cool!

Another way to do it is to use rsync and sshpass:

sshpass -p mypassword rsync -rP file1 file2 file3 user@bmc:/tmp/

Cheers,

Joel

>  
>  
> pushit.exp 9.3.164.147 ipmid /home/root libapphandler.so
> /usr/lib/host-ipmid
>  
> If you have access to expect, the script is between the "=" signs
> below...
>  
> ========================================
> #!/usr/bin/expect -f
>  
> set maxloop "[llength $argv]"
>  
> if {$maxloop < 3} {
>     puts "USAGE:  $argv0 <ip> \[<srcfile> <destination_dir>\] ..."
>     exit 1
> }
> set bmcpwd "0penBmc\r"
> set bmcip "[lindex $argv 0]"
> set bmcsystem "root@$bmcip"
>  
> for {set i 1} {$i < $maxloop} {incr i 2} {
>     
>     set cmd "/usr/bin/scp [lindex $argv $i] $bmcsystem:[lindex $argv
> $i+1] "
>     puts $cmd
>     spawn {*}$cmd;
>     expect "password:"
>     send $bmcpwd
>  
> }
> ========================================
>  
>  
>  
>  
>  
> 
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)
