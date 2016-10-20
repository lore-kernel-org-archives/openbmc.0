Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szsrq3mgqzDrbg
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 13:17:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3szsrq14T4z9sCZ;
 Thu, 20 Oct 2016 13:17:15 +1100 (AEDT)
Subject: Re: [PATCH linux v5 18/18] Documenation: Add basic FSI text file
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-19-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <7cd0c036-5e16-b69a-409d-897a06c263a6@ozlabs.org>
Date: Thu, 20 Oct 2016 10:17:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476918586-13475-19-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Oct 2016 02:17:15 -0000

Hi Chris,

> Add documentation explaining the basics of FSI and how to find
> more information.
> +The Flexible Support Interface (FSI) is a two wire bus consisting of
> +a serial data line and a clock capable of running at up to 166 MHz.
> +FSI features strong data integrity with CRC protection and is capable
> +of very high fan out.
> +
> +The complete hardware specification[1] for FSI is publicly available on
> +the OpenPower Foundation website:
> +
> +[1] http://openpowerfoundation.org/wp-content/uploads/resources/OpenFSI-spec/content/ch_preface.html
> +
> +Common FSI terminology:
> +
> +* Master
> +    Controller of the FSI bus.  Only the master is allowed to control the
> +    clock line and is the initiator of all transactions on a bus.
> +
> +* Slave
> +    The receiver or target of a master initiated transaction.  The slave
> +    cannot initiate communications on a bus and must respond to any
> +    master requests for data.
> +
> +* CFAM
> +    Stands for Common Field replaceable unit Access Macro.  A CFAM is an
> +    ASIC residing in any device requiring FSI communications. CFAMs
> +    consist of an array of hardware 'engines' used for various purposes.
> +    I2C masters, UARTs, General Purpose IO hardware are common types of
> +    these engines.
> +
> +* Configuration Space / Configuration Table
> +    A table contained at the beginning of each CFAM address space.
> +    This table lists information such as the CFAM's ID, which engine types
> +    and versions it contains, as well as its addressing range.
> +
> +* FSI Client driver
> +    A device driver that registers with the FSI core so that it can access
> +    devices it owns on an FSI bus.

Is "client" something new, or is this standard FSI terminology? I would
have thought "engine" is the term used elsewhere.

Anyway, here's a little more to tie it into the kernel implementation:

------------
In Linux, we have a core FSI "bus type", along with drivers for FSI
masters and clients.

The FSI master drivers expose a read/write interface to the bus address
space. The master drivers are under drivers/fsi/fsi-master-*.c.

The core handles probing and discovery of slaves and slave
engines, using those read/write interfaces. It is responsible for
creating the endpoint Linux devices corresponding to the discovered
engines on each slave.

Slave engines are identified by an 'engine' type, and an optional
version. Client drivers are matched and bound to these engines during
discovery.

------------

We may want to add some description of the APIs, but that should do for
now.

Cheers,


Jeremy
