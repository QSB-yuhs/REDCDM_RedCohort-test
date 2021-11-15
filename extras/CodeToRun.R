library(redCohort)
renv::restore()

# Maximum number of cores to be used:
maxCores <- parallel::detectCores()

# The folder where the study intermediate and result files will be written:
outputFolder <- ""

# Details for connecting to the server:
connectionDetails <-
        DatabaseConnector::createConnectionDetails(
                dbms = "",
                server = "",
                user = "",
                password = "",
                port = ""
        )

# The name of the database schema where the CDM data can be found:
cdmDatabaseSchema <- ""

# The name of the database schema and table where the study-specific cohorts will be instantiated:
cohortDatabaseSchema <- ""
cohortTable <- ""

# Some meta-information that will be used by the export function:
databaseId <- "REDCDM"
databaseName <- "REDCDM"
databaseDescription <- "REDCDM"

# For Oracle: define a schema that can be used to emulate temp tables:
tempEmulationSchema <- NULL

redCohort::execute(
        connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cohortDatabaseSchema = cohortDatabaseSchema,
        cohortTable = cohortTable,
        tempEmulationSchema = tempEmulationSchema,
        outputFolder = outputFolder,
        databaseId = databaseId,
        databaseName = databaseName,
        databaseDescription = databaseDescription,
        minCellCount = 1
        
)


CohortDiagnostics::preMergeDiagnosticsFiles(dataFolder = outputFolder)
#shared file: c:/REDCDM/diagnosticsExport/Results_REDCDM.zip

CohortDiagnostics::launchDiagnosticsExplorer(dataFolder = outputFolder)

