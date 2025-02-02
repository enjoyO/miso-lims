package uk.ac.bbsrc.tgac.miso.core.data.spreadsheet;

import java.util.Arrays;
import java.util.List;

import uk.ac.bbsrc.tgac.miso.core.data.DetailedSample;
import uk.ac.bbsrc.tgac.miso.core.data.RunPartitionAliquot;
import uk.ac.bbsrc.tgac.miso.core.data.Sample;
import uk.ac.bbsrc.tgac.miso.core.util.LimsUtils;

public enum RunLibrarySpreadsheets implements Spreadsheet<RunPartitionAliquot> {

  LIBRARY_SEQUENCING_REPORT("Library Sequencing Report", //
      Column.forString("Instrument Model", runLib -> runLib.getRun().getSequencer().getInstrumentModel().getAlias()), //
      Column.forString("Run Name", runLib -> runLib.getRun().getName()), //
      Column.forString("Run Alias", runLib -> runLib.getRun().getAlias()), //
      Column.forString("Pool Name", runLib -> runLib.getPartition().getPool().getName()), //
      Column.forString("Library Aliquot Name", runLib -> runLib.getAliquot().getName()), //
      Column.forString("Library Aliquot Alias", runLib -> runLib.getAliquot().getAlias()), //
      Column.forString("External Name", true, RunLibrarySpreadsheets::getExternalName) //
  );

  private static String getExternalName(RunPartitionAliquot runLibrary) {
    Sample sample = runLibrary.getAliquot().getLibrary().getSample();
    if (LimsUtils.isDetailedSample(sample)) {
      return ((DetailedSample) sample).getIdentityAttributes().getExternalName();
    } else {
      return null;
    }
  }

  private final String description;
  private final List<Column<RunPartitionAliquot>> columns;

  @SafeVarargs
  private RunLibrarySpreadsheets(String description, Column<RunPartitionAliquot>... columns) {
    this.description = description;
    this.columns = Arrays.asList(columns);
  }

  @Override
  public List<Column<RunPartitionAliquot>> columns() {
    return columns;
  }

  @Override
  public String description() {
    return description;
  }

}
