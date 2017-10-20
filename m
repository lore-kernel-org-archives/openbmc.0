Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJYhf6KtVzDqKs
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 05:09:05 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9KI73qT024039
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 14:08:56 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dqjuvh9s3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 14:08:56 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 20 Oct 2017 14:08:55 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 20 Oct 2017 14:08:54 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9KI8rgs53673990; Fri, 20 Oct 2017 18:08:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47AEA12403F;
 Fri, 20 Oct 2017 14:06:03 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.85.90.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 7B677124035;
 Fri, 20 Oct 2017 14:06:01 -0400 (EDT)
Subject: Re: Fw: [PATCH linux dev-4.10] drivers: i2c: fsi: Add proper abort
 method
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
References: <OF986BC2D4.826B0327-ON002581BF.00635D8F-862581BF.00636913@notes.na.collabserv.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 20 Oct 2017 13:08:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <OF986BC2D4.826B0327-ON002581BF.00635D8F-862581BF.00636913@notes.na.collabserv.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17102018-0036-0000-0000-0000027ECCC5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007925; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00933962; UDB=6.00470471; IPR=6.00714251; 
 BA=6.00005651; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017630; XFM=3.00000015;
 UTC=2017-10-20 18:08:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102018-0037-0000-0000-00004223B755
Message-Id: <2fd0a134-eb40-aedd-166d-b4095625b940@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710200252
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2017 18:09:09 -0000


Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
>
> On 10/20/2017 12:15 AM, Andrew Jeffery wrote:
> > On Thu, 2017-10-12 at 15:42 -0500, Eddie James wrote:
> >> From: "Edward A. James" <eajames@us.ibm.com>
> >>
> >> Driver wasn't cleaning up on timeout or in an error situation properly.
> >> Need to do a full reset if we fail in order to re-stablish a good state
> >> of the engine.
> >>
> >> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >> ---
> >>   drivers/i2c/busses/i2c-fsi.c | 259 
> +++++++++++++++++++++++++++++++------------
> >>   1 file changed, 191 insertions(+), 68 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-fsi.c 
> b/drivers/i2c/busses/i2c-fsi.c
> >> index 1af9c01..6c582d8 100644
> >> --- a/drivers/i2c/busses/i2c-fsi.c
> >> +++ b/drivers/i2c/busses/i2c-fsi.c
> >> @@ -133,6 +133,11 @@
> >>   #define I2C_ESTAT_SELF_BUSY 0x00000040
> >>   #define I2C_ESTAT_VERSION 0x0000001f
> >>
> >> +#define I2C_PORT_BUSY_RESET 0x80000000
> >> +
> >> +#define I2C_LOCAL_WAIT_TIMEOUT 2 /* jiffies */
> >> +#define I2C_ABORT_TIMEOUT msecs_to_jiffies(100)
> >> +
> >>   struct fsi_i2c_master {
> >>   struct fsi_device *fsi;
> >>   u8 fifo_size;
> >> @@ -351,22 +356,185 @@ static int fsi_i2c_read_fifo(struct 
> fsi_i2c_port *port, struct i2c_msg *msg,
> >>   return rc;
> >>   }
> >>
> >> +static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c)
> >> +{
> >> + int i, rc;
> >> + u32 mode, dummy = 0;
> >> +
> >> + rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + mode |= I2C_MODE_DIAG;
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + for (i = 0; i < 9; ++i) {
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> >> + if (rc)
> >> + return rc;
> >> + }
> >> +
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + mode &= ~I2C_MODE_DIAG;
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> >> +
> >> + return rc;
> >> +}
> >> +
> >> +static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
> >> +{
> >> + int rc;
> >> + u32 mode, stat, dummy = 0;
> >> +
> >> + /* reset engine */
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + /* re-init engine */
> >> + rc = fsi_i2c_dev_init(i2c);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + /* set port; default after reset is 0 */
> >> + if (port) {
> >> + mode = SETFIELD(I2C_MODE_PORT, mode, port);
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> >> + if (rc)
> >> + return rc;
> >> + }
> >> +
> >> + /* reset busy register; hw workaround */
> >> + dummy = I2C_PORT_BUSY_RESET;
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + /* force bus reset */
> >> + rc = fsi_i2c_reset_bus(i2c);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + /* reset errors */
> >> + dummy = 0;
> >> + rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> >> + if (rc)
> >> + return rc;
> >> +
> >> + /* wait for command complete */
> >> + set_current_state(TASK_INTERRUPTIBLE);
> >> + schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT);
> > Shouldn't we use the uninterruptible state to ensure we get at least
> > I2C_LOCAL_WAIT_TIMEOUT in the face of signals?
>
> Good point, I'll switch that.
>
> Thanks!
> Eddie
>
> >
> > Andrew
>
>
>
