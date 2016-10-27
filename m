Return-Path: <alastair@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4DXy4VYrzDt4V
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:33:38 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9R4TChm096295
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 00:33:36 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26ba818wh0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 00:33:36 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 27 Oct 2016 14:33:34 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 27 Oct 2016 14:33:33 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id C3EF53578052
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:33:32 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9R4XWth19464236
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:33:32 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9R4XW4f030817
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:33:32 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9R4XW9q030814; Thu, 27 Oct 2016 15:33:32 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2F868A019C;
 Thu, 27 Oct 2016 15:33:31 +1100 (AEDT)
Subject: Re: [PATCH 0/3] Add QEMU support for the Epson rx8900 RTC
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@koad.org
Date: Thu, 27 Oct 2016 15:33:31 +1100
In-Reply-To: <CACPK8XdUpYOF_jgRhzwvUp=P7eemgYYgY7UJW-2TOP+YJnRUHg@mail.gmail.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <CACPK8XdUpYOF_jgRhzwvUp=P7eemgYYgY7UJW-2TOP+YJnRUHg@mail.gmail.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102704-0040-0000-0000-000001F1CBF4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102704-0041-0000-0000-00000AC305EB
Message-Id: <1477542811.2176.93.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-27_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610270077
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
X-List-Received-Date: Thu, 27 Oct 2016 04:33:39 -0000

On Thu, 2016-10-27 at 14:52 +1030, Joel Stanley wrote:
> Hi Alastair,
> 
> On Thu, Oct 27, 2016 at 12:57 PM,  <alastair@au1.ibm.com> wrote:
> > 
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > This series adds preliminary support for the Epson rx8900 RTC.
> > 
> > Setting and retrieving time is supported, and the chip temperature
> > is hardcoded.
> 
> I commented in the patch about setting the temperature with a
> property
> so we can adjust it at runtime with the monitor.

That sounds like a good idea.

> > 
> > Other features (in particular, those that require the interrupt
> > line)
> > are not implmented.
> 
> Do you intend to implement these features?

Only if necessary. I need to understand how to wire the virtual non-i2c 
interrupt line from the RTC to the SOC before these could be
implemented.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819
