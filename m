Return-Path: <tpearson@raptorengineering.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=192.119.205.245;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="YCbIdKzp"; dkim-atps=neutral
X-Greylist: delayed 543 seconds by postgrey-1.36 at bilbo;
 Mon, 05 Feb 2018 18:03:41 AEDT
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZdq16ln9zDr6h
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 18:03:41 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AA52064120A
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 00:54:34 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id U_DqtwdwbCeB for <openbmc@lists.ozlabs.org>;
 Mon,  5 Feb 2018 00:54:34 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2426664128C
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 00:54:34 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 2426664128C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1517813674; bh=sDFLt7kpccnY/ezhGLE+XsGNL6AR8vyiiaDZQBpS/IM=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=YCbIdKzpRY+5HYsIg9/wYV8KjVOQI59fFXZAyI/vxact4jZ8Lp3lqSm3tDZ6CXRrs
 J4m28AaLsmj5VegFL8TB0nKk00XLAGbcM/feNf3MkiRrw8JE+yzodoxRIHRGaL0Ax3
 DoH9qFwupl1oKyYi+KN3ZtmJU+Ec0VuXzNkelHAI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oJsIii1x4vZx for <openbmc@lists.ozlabs.org>;
 Mon,  5 Feb 2018 00:54:33 -0600 (CST)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 939E764120A
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 00:54:33 -0600 (CST)
Message-ID: <5A77FFA9.3060507@raptorengineering.com>
Date: Mon, 05 Feb 2018 00:54:33 -0600
From: Timothy Pearson <tpearson@raptorengineering.com>
Organization: Raptor Engineering, LLC
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Host IPL observer service
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 07:03:43 -0000

We've created a service to watch the status of the host IPL and to
provide the status and host state information on demand and via events
over DBUS.  This is important for several reasons, one of which is to
make sure that we don't try to bind to OCC before OCC is up and running.

We're shipping this service with our Talos II systems, and already use
it to provide status feedback to the end user during the lengthy IPL
process, as well as to bind OCC at the correct time.

Source code is here:

https://git.raptorcs.com/git/talos-skeleton/tree/pyiplobserver

Let me know what you think!  We'd love to see this upstreamed.

-- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
